# An entity decorator class
class Player < SimpleDelegator
  def initialize(entity)
    # pass entity to delegator
    super(entity)
    entity.character = " @ "
    @health = base_health_value + 5
  end

  attr_accessor :health
  
  def attack_value
    base_attack_value
  end

  def name
    "Oz"
  end

  def attack(target)
    target.take_damage(attack_value)
  end

  def take_damage(damage)
    self.health =- damage
  end
end
