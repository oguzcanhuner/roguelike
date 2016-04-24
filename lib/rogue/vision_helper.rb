module Rogue
  class VisionHelper
    def initialize(map)
      @map = map
    end

    # Check to see if the source can see the target
    def can_see?(source:, target:)
      # draw a line between the source and target
      x1, y1 = source.coord.x.to_f, source.coord.y.to_f
      x2, y2 = target.coord.x.to_f, target.coord.y.to_f

      m = (y1-y2)/(x1-x2)
      b = y1 - (m * x1)

      # Go through all cells in a line between two points
      range = x1 < x2 ? (x1.to_i+1).upto(x2) : (x1.to_i-1).downto(x2)

      range.each do |x|
        y = ((m * x) + b).round
        cell = @map.cell(Coordinate.new(x.to_i, y))
        # break the loop if the cell is a wall, meaning the
        # line of vision is broken
        return false if cell.wall?
      end
      return true
    end
  end
end
