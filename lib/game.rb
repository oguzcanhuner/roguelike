class Game
  def setup
    @map = Map.new(height: 10, width: 10)
    @player = initialize_player
    @map
  end

  def step(key)
    move_player(key)
    @map
  end

  private
  def initialize_player
    player = CellContent::Player.new
    @map.populate_cell(5, 5, player)
    player
  end

  def move_player(key)
    movement = MovementHelper.calculate_movement(current_coordinates: @player.coords, 
                                                 direction: key)
    @map.move_object(from: movement[:from], to: movement[:to])
  end
end
