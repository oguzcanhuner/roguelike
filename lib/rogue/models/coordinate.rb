class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  DIRECTIONS = [:left, :topleft, :up, :topright, :right, :bottomright, :down, :bottomleft]
  DIAGONALS_FIRST = DIRECTIONS.partition {|dir| DIRECTIONS.index(dir).odd?}.flatten

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
    DIRECTIONS.each do |direction|
      return true if self.send(direction).eql?(coord)
    end
    false
  end

  def up?(coord)
    self.y < coord.y
  end

  def down?(coord)
    self.y > coord.y
  end

  def left?(coord)
    self.x < coord.x
  end

  def right?(coord)
    self.x > coord.x
  end

  def topleft?(coord)
    left?(coord) && up?(coord)
  end

  def topright?(coord)
    right?(coord) && up?(coord)
  end

  def bottomleft?(coord)
    left?(coord) && down?(coord)
  end

  def bottomright?(coord)
    right?(coord) && down?(coord)
  end

  def direction_to_follow(coord)
    DIAGONALS_FIRST.each do |direction|
      return DIRECTIONS[DIRECTIONS.index(direction)-4] if self.send(query(direction), coord)
    end
    false
  end

  private

  def query(symbol)
    (symbol.to_s << '?').to_sym
  end

end
