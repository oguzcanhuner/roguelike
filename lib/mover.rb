class Mover
  def initialize(grid, moveable)
    @grid = grid
    @moveable = moveable
  end

  def move(direction)
    current_coords = @moveable.coords
    new_coords = calculate_new_coords(current_coords, direction)
    if @grid.cell(new_coords[0], new_coords[1])
      @grid.populate_cell(new_coords[0], new_coords[1], @moveable)
      @grid.empty_cell(current_coords[0], current_coords[1])
    end
  end

  private

  def calculate_new_coords(current, direction)
    x, y = current[0], current[1]
    return [x-1, y] if direction == :left
    return [x+1, y] if direction == :right
    return [x, y+1] if direction == :down
    return [x, y-1] if direction == :up
  end
end
