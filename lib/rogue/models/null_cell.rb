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

  def x
    coord.x
  end

  def y
    coord.y
  end

  def discovered?
    false
  end

  def discover!
    true
  end
end
