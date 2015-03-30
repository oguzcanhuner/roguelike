class Player
  def initialize
    @character = " @ "
    @cell = nil
  end

  attr_reader :character
  attr_accessor :cell

  def coords
    cell.coords
  end

  def to_s
    @character
  end
end
