class Game
  def initialize(map:)
    @map = map
  end

  def setup
    #@movement_helper = MovementHelper.new(map: @map)
    @player = initialize_player
    @npcs = initialize_npcs
    { player: @player }
  end

  def step(key)
    send(*(keys[key] || [:do_nothing]))
    npc_phase
    @map
  end

  private
  def keys
  {
    'h' => [:move_player, :left],
    'j' => [:move_player, :down],
    'k' => [:move_player, :up],
    'l' => [:move_player, :right],
  }
  end

  def do_nothing
  end

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

  def move_player(direction)
    @player.move(direction: direction)
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
