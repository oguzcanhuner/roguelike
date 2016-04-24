class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  DIRECTIONS = [:left, :topleft, :up, :topright, :right, :bottomright, :down, :bottomleft]

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

  def topleft
    Coordinate.new(x-1, y-1)
  end

  def topright
    Coordinate.new(x+1, y-1)
  end

  def bottomleft
    Coordinate.new(x-1, y+1)
  end

  def bottomright
    Coordinate.new(x+1, y+1)
  end

  def adjacent?(coord)
    DIRECTIONS.each do |direction|
      return true if self.send(direction).eql?(coord)
    end
    false
  end

  def above?(coord)
    self.y < coord.y
  end

  def below?(coord)
    self.y > coord.y
  end

  def left_of?(coord)
    self.x < coord.x
  end

  def right_of?(coord)
    self.x > coord.x
  end

  def topleft_of?(coord)
    left_of?(coord) && above?(coord)
  end

  def topright_of?(coord)
    right_of?(coord) && above?(coord)
  end

  def bottomleft_of?(coord)
    left_of?(coord) && below?(coord)
  end

  def bottomright_of?(coord)
    right_of?(coord) && below?(coord)
  end

  def eql?(object)
    object.x == x && object.y == y
  end

  def hash
    [x, y].hash
  end
end
