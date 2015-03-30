#returns coordinates to help with movement
class MovementHelper
  DIRECTIONS = {
    h: :left,
    k: :up,
    j: :down,
    l: :right,
  }

  def self.calculate_movement(current_coordinates:, 
                              direction:, 
                              steps: 1)
    coordinates = { from: current_coordinates }
    direction = DIRECTIONS[direction.to_sym]
    x, y = current_coordinates

    coordinates[:to] = [x, y] if direction.nil?
    coordinates[:to] = [x-1, y] if direction == :left
    coordinates[:to] = [x+1, y] if direction == :right
    coordinates[:to] = [x, y+1] if direction == :down
    coordinates[:to] = [x, y-1] if direction == :up
    coordinates
  end
end
