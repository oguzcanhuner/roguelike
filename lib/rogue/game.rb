module Rogue
  class Game
    def initialize(map:)
      @map = map
      @messages = []
      @player = initialize_player
      @npcs = initialize_npcs
      @active_phase = PlayerPhase.new(game: self)
    end

    attr_reader :messages, :map, :player, :npcs

    def step(key)
      @active_phase = @active_phase.perform(key)
      npc_phase unless [:cancel, :start_attack].include?(@active_phase.last_action)
    end

    def add_message(message)
      @messages << message
    end

    private
    def initialize_npcs
      npcs = []
      10.times do
        npc = NPC.new
        @map.populate_random_empty_cell(npc)
        npcs << npc
      end
      npcs
    end

    def initialize_player
      player = Player.new
      @map.populate_random_empty_cell(player)
      player
    end

    def npc_phase
      phase = NpcPhase.new(game: self, npcs: @npcs)
      phase.perform
    end

  end
end
