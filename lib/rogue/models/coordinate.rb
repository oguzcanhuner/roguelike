class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  CHASE_DIRECTIONS = {:above? => :down, :below? => :up, :left_of? => :right, :right_of? => :left}

  def eql?(object)
    object.x == x && object.y == y
  end

  def hash
    [x, y].hash
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

  def adjacent?(coord)
    [:up, :down, :left, :right].each do |direction|
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

  def direction_to_chase(coord)
    [:above?, :below?, :left_of?, :right_of?].each do |relation|
      return CHASE_DIRECTIONS[relation] if self.send(relation, coord)
    end
    false
  end
end
