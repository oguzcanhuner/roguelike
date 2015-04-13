# An entity decorator class
class Player < SimpleDelegator
  def initialize(entity)
    # pass entity to delegator
    super(entity)
    entity.character = " @ "
    @health = max_health
  end

  attr_accessor :health

  def max_health
    base_health_value
  end

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
