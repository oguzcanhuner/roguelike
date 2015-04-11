require 'state_machine' 
class Game
  state_machine :state, initial: :moving do
    state :moving, value: MovementPhase
    state :attacking, value: AttackPhase

    event :attack do
      transition moving: :attacking, attacking: :moving
    end

    event :cancel_attack do
      transition attacking: :moving
    end
  end

  def initialize(map:)
    @map = map
    @messages = []
    super()
  end

  attr_reader :messages

  def setup
    @player = initialize_player
    @npcs = initialize_npcs
    { player: @player }
  end

  def step(key)
    current_phase = state.new(game: self, map: @map, player: @player)
    current_phase.perform(key)
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
    @npcs.each do |npc|
      npc.move(direction: [:left, :right, :up, :down].sample)
    end
  end

  def interactive_entity
    InteractiveEntity.new(map: @map)
  end

end
