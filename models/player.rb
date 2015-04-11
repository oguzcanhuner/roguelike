# An entity decorator class
class Player < SimpleDelegator
  def initialize(entity)
    # pass entity to delegator
    super(entity)
    entity.character = " @ "
  end

  def health
    20
  end

  def name
    "Oz"
  end
end
