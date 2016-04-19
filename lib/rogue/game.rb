module Rogue
  class Game
    def initialize(map: , number_of_npcs: 10)
      @map = map
      @messages = []
      @player = initialize_player
      @npcs = initialize_npcs(number_of_npcs)
      @active_phase = PlayerPhase.new(game: self)
    end

    attr_reader :messages, :map, :player, :npcs

    def step(key)
      @active_phase = @active_phase.perform(key)
      npc_phase if [:move, :attack].include?(@active_phase.last_action)
      self
    end

    def add_message(message)
      @messages << message
    end

    def over?
      !@player.alive?
    end

    private

    def initialize_npcs(number)
      npcs = []
      number.times do
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
      phase = NpcPhase.new(game: self)
      phase.perform
    end
  end
end
