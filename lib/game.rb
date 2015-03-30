class Game

  def setup
    @map = Map.new(height: 100, width: 100)
    @player = initialize_player
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

  def initialize_player
    player = CellContent::Player.new
    @map.populate_cell(5, 5, player)
    player
  end

  def move_player(direction)
    movement = MovementHelper.calculate_movement(current_coordinates: @player.coords, 
                                                 direction: direction)
    @map.move_object(from: movement[:from], to: movement[:to])
  end

end
