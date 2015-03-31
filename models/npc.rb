class NPC
  def initialize(movement_helper:)
    @character = " D "
    @movement_helper = movement_helper
  end

  attr_accessor :cell

  def coords
    cell.coords
  end

  def to_s
    @character
  end

  def solid?
    true
  end

  def move(direction)
    @movement_helper.move(self, direction)
  end
end
