class Cell
  def initialize(coord, content: EmptyCell.new)
    @coord = coord
    @x = coord.x
    @y = coord.y
    @content = content
    @discovered = false
  end
  
  attr_reader :coord, :x, :y, :content
  attr_accessor :content, :discovered

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

  def discovered?
    @discovered
  end

  def discover!
    @discovered = true
  end
end
