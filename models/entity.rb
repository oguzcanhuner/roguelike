class Entity
  attr_accessor :character

  def to_s
    character
  end

  def solid?
    true
  end
end
