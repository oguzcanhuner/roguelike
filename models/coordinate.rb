class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def eql?(object)
    object.x == x && object.y == y
  end

  def up
    Coordinate.new(x, y-1)
  end

  def down
    Coordinate.new(x, y+1)
  end

  def left
    Coordinate.new(x-1, y)
  end

  def right
    Coordinate.new(x+1, y)
  end
end
