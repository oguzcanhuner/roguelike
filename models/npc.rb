class NPC
  def initialize(entity)
    @entity = entity
    @entity.character = " D "
  end

  # refactor these by using delegation
  def cell
    @entity.cell
  end

  def cell=(cell)
    @entity.cell = cell
  end

  def coords
    @entity.coords
  end

  def move(direction)
    @entity.move(direction)
  end

  def to_s
    @entity.to_s
  end

  def solid?
    @entity.solid?
  end
end
