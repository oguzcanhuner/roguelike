class Game

  def setup
    @map = Map.new(height: 100, width: 100)
    @movement_helper = MovementHelper.new(map: @map)
    @map_generator = MapGenerator.new(map: @map)
    @player = initialize_player
    @npcs = initialize_npcs
    { map: @map, player: @player }
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
    npc1 = NPC.new(movement_helper: @movement_helper)
    npc2 = NPC.new(movement_helper: @movement_helper)
    npc3 = NPC.new(movement_helper: @movement_helper)
    @map.populate_cell(8, 6, npc1)
    @map.populate_cell(3, 1, npc2)
    @map.populate_cell(10, 5, npc3)
    [npc1, npc2, npc3]
  end

  def initialize_player
    player = Player.new(movement_helper: @movement_helper)
    @map.populate_cell(5, 5, player)
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

end
