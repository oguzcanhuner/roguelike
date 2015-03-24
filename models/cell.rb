class Cell
  def initialize(x, y, content: EmptyCell.new)
    @x = x
    @y = y
    @content = content
  end
  
  attr_reader :x, :y, :content

  def character
    content.character
  end
end

class EmptyCell
  def initialize
    @character = " . "
  end

  attr_reader :character
end

class Player
  def initialize
    @character = " @ "
  end

  attr_reader :character
end
