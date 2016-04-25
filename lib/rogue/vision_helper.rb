module Rogue
  class VisionHelper
    def initialize(map)
      @map = map
    end

    # Check to see if the source can see the target
    def can_see?(source:, target:)
      # walk along a line between the source and target
      x1, y1 = source.coord.x.to_f, source.coord.y.to_f
      x2, y2 = target.coord.x.to_f, target.coord.y.to_f

      delta_x = x2 - x1
      delta_y = y2 - y1

      # Get the distance between the two points
      distance = Math.sqrt((delta_x * delta_x) + (delta_y * delta_y))
      speed = 1
      iterations = (distance / speed).ceil
      ratio = speed/distance

      # Iterate over the distance in steps of 1. I.e. a distance of 6 will have 6 iterations
      iterations.times do |i|
        # Calculate how much we should move in this iteration
        x_move = ratio * delta_x
        y_move = ratio * delta_y

        # Set the new coordinates based on the amount moved
        x1 = x_move + x1
        y1 = y_move + y1

        # Find the cell at the new coordinate and determine if its a wall or not
        cell = @map.cell(Coordinate.new(x1.round, y1.round))
        return false if cell.wall?

        # Set the new delta values based on the current coordinate
        delta_x = x2 - x1
        delta_y = y2 - y1
      end
      return true
    end
  end
end
