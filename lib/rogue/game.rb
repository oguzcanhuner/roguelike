module Rogue
  class Game
    def initialize(map:)
      @map = map
      @messages = []
    end

    attr_reader :messages, :map, :player

    def setup
      @player = initialize_player
      @npcs = initialize_npcs
      { player: @player }
    end

    def step(key)
      player_phase(key)
      npc_phase
    end

    def add_message(message)
      @messages << message
    end

    private
    def initialize_npcs
      npcs = []
      10.times do
        npc = NPC.new(interactive_entity)
        @map.populate_random_empty_cell(npc)
        npcs << npc
      end
      npcs
    end

    def initialize_player
      player = Player.new(interactive_entity)
      @map.populate_random_empty_cell(player)
      player
    end

    def npc_phase
      phase = NpcPhase.new(game: self, npcs: @npcs)
      phase.perform
    end

    def player_phase(key)
      phase = PlayerPhase.new(game: self)
      phase.perform(key)
    end

    def interactive_entity
      InteractiveEntity.new(map: @map)
    end

  end
end
