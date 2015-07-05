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
end
