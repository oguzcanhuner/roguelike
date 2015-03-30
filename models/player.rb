class Player
  def initialize
    @character = " @ "
  end

  attr_accessor :cell

  def coords
    cell.coords
  end

  def to_s
    @character
  end
end
