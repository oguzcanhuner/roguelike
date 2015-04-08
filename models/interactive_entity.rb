class InteractiveEntity < Entity
  def initialize(movement_helper:)
    @movement_helper = movement_helper
  end

  attr_accessor :cell

  def coords
    cell.coords
  end

  def move(direction)
    @movement_helper.move(self, direction)
  end
end
