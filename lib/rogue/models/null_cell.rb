class NullCell
  def passable?
    false
  end

  def wall?
    false
  end

  def to_s
    ""
  end

  def attackable?
    false
  end

  def coord
    Coordinate.new(-1, -1)
  end
end
