class Cell
  def initialize(x, y)
    @x = x
    @y = y
    @character = " . "
  end
  
  attr_reader :x, :y, :character
end
