class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  CHASE_DIRECTIONS = {:above? => :down, :below? => :up, :left_of? => :right, :right_of? => :left, \
  :topleft_of? => :bottomright, :topright_of? => :bottomleft, :bottomright_of? => :topleft, :bottomleft_of? => :topright}

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
    [:up, :down, :left, :right, :topleft, :topright, :bottomleft, :bottomright].each do |direction|
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

  def direction_to_chase(coord)
    [:topleft_of?, :topright_of?, :bottomleft_of?, :bottomright_of?, :above?, :below?, :left_of?, :right_of?].each do |relation|
      return CHASE_DIRECTIONS[relation] if self.send(relation, coord)
    end
    false
  end


end
