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
