class NPC < SimpleDelegator
  def initialize(entity) 
    super(entity)
    entity.character = " D "
  end
end
