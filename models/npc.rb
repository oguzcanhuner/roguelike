class NPC
  def initialize
    @character = " D "
  end

  attr_accessor :cell

  def coords
    cell.coords
  end

  def to_s
    @character
  end
end
