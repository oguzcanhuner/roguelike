class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  DIRECTIONS = [:left, :topleft, :up, :topright, :right, :bottomright, :down, :bottomleft]
  DIRECTIONS_DIAGONALS_FIRST = DIRECTIONS.partition { |dir| DIRECTIONS.index(dir).odd? }.flatten

  ROTATE_PATTERN = [-1, -1, 0, +1, +1, +1, 0, -1]
  X_ROTATION = ROTATE_PATTERN
  Y_ROTATION = X_ROTATION.rotate(-2)

  def method_missing(direction, *args)
    if DIRECTIONS.include?(direction)
      rotation_index = DIRECTIONS.index(direction)
      Coordinate.new((x + X_ROTATION[rotation_index]), (y + Y_ROTATION[rotation_index]))
    elsif DIRECTIONS.include?(unquery(direction))
      check_in_direction(direction, args[0])
    end
  end

  def adjacent?(coord)
    DIRECTIONS.each do |direction|
      return true if self.send(direction).eql?(coord)
    end
    false
  end

  def direction_to_follow(coord)
    DIRECTIONS_DIAGONALS_FIRST.each do |direction|
      return DIRECTIONS[DIRECTIONS.index(direction)-4] if self.send(query(direction), coord)
    end
    false
  end

  def eql?(object)
    object.x == x && object.y == y
  end

  def hash
    [x, y].hash
  end

  def respond_to?(method, *args)
    return true if DIRECTIONS.include?(method) || DIRECTIONS.include?(unquery(method))
    super
  end

  private

  def check_in_direction(direction, coord)
    rotation_mappings = {:x => X_ROTATION, :y => Y_ROTATION}
    evals = []
    rotation_mappings.each do |axis, rotation|
      index = DIRECTIONS.index(unquery(direction))
      compare_string = "self.#{axis} ? coord.#{axis}"
      if rotation[index] > 0
        evals << compare_string.gsub('?', '>')
      elsif rotation[index] < 0
        evals << compare_string.gsub('?', '<')
      end
    end
    eval(evals.join(' && '))
  end

  def query(symbol)
    resymbol(symbol) { |sym| sym << '?' }
  end

  def unquery(symbol)
    resymbol(symbol) { |sym| sym.chop! }
  end

  def resymbol(sym)
    yield(sym.to_s).to_sym
  end

end
