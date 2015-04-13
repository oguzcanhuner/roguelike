# An entity decorator class
class Player < SimpleDelegator
  def initialize(entity)
    # pass entity to delegator
    super(entity)
    entity.character = " @ "
  end

  def name
    "Oz"
  end
end
