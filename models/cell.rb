class Cell
  def initialize(coord, content: EmptyCell.new)
    @coord = coord
    @x = coord.x
    @y = coord.y
    @content = content
  end
  
  attr_reader :coord, :x, :y, :content
  attr_accessor :content

  def to_s
    content.to_s
  end

  def passable?
    !content.solid?
  end

  def wall?
    content.class == Wall
  end

  def empty?
    content.class == EmptyCell
  end

  def attackable?
    content.attackable?
  end
end

class EmptyCell
  def initialize
    @character = " . "
  end

  def to_s
    @character
  end

  def solid?
    false
  end

  def attackable?
    false
  end
end

class Wall
  def initialize
    @character = " # "
  end

  def to_s
    @character
  end

  def solid?
    true
  end

  def attackable?
    false
  end
end

class NullCell
  def passable?
    false
  end

  def to_s
    ""
  end

  def wall?
    true
  end

  def attackable?
    false
  end
end
