#returns coordinates to help with movement
class MovementHelper

  def initialize(map:)
    @map = map
  end

  def move(moveable, direction:)
    coordinates = calculate_movement(current_coordinates: moveable.coords, direction: direction)
    @map.move_object(from: coordinates.fetch(:from), to: coordinates.fetch(:to) )
  end

  private
  def calculate_movement(current_coordinates:, 
                         direction:)
    coordinates = { from: current_coordinates }
    x, y = current_coordinates

    coordinates[:to] = [x, y] if direction.nil?
    coordinates[:to] = [x-1, y] if direction == :left
    coordinates[:to] = [x+1, y] if direction == :right
    coordinates[:to] = [x, y+1] if direction == :down
    coordinates[:to] = [x, y-1] if direction == :up
    coordinates
  end
end
