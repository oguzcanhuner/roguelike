class Game

  def setup
    @map = Map.new(height: 100, width: 100)
    @movement_helper = MovementHelper.new(map: @map)
    @player = initialize_player
    initialize_npcs
    { map: @map, player: @player }
  end

  def step(key)
    send(*keys[key])
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

  def initialize_npcs
    npc = NPC.new
    @map.populate_cell(8, 6, npc)
  end

  def initialize_player
    player = Player.new(movement_helper: @movement_helper)
    @map.populate_cell(5, 5, player)
    player
  end

  def move_player(direction)
    @player.move(direction: direction)
  end

end
