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
