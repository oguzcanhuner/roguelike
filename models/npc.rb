class NPC < SimpleDelegator
  def initialize(entity) 
    super(entity)
    entity.character = " D "
    @health = base_health_value - 5
  end

  attr_accessor :health

  def attack_value
    base_attack_value
  end

  def attack(target)
    target.take_damage(attack_value)
  end

  def take_damage(damage)
    self.health =- damage
  end
end
