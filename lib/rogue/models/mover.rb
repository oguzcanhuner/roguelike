# Include this module in any object which should be moveable
module Rogue
  module Mover
    attr_accessor :cell

    def coord
      cell.coord
    end

    def move(direction:)
      Rogue.map.move_object(from: coord, to: coord.send(direction))
    end
  end
end
