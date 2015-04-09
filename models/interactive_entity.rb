class InteractiveEntity < Entity
  def initialize(map:)
    @map = map
  end

  attr_accessor :cell

  def coord
    cell.coord
  end

  def move(direction:)
    @map.move_object(from: coord, to: coord.send(direction))
    #@movement_helper.move(self, direction)
  end
end
