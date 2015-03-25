class Cell
  def initialize(x, y, content: EmptyCell.new)
    @x = x
    @y = y
    @content = content
  end
  
  attr_reader :x, :y, :content
  attr_accessor :content

  def character
    content.character
  end

  def coords
    [x, y]
  end
end

class EmptyCell
  def initialize
    @character = " . "
  end

  attr_reader :character
end

