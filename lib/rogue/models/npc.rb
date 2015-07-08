class NPC < SimpleDelegator
  include Rogue::Mover

  def initialize
    @map = Rogue.map
    @character = " D "
    @base_health_value = 20
    @base_attack_value = 5
    @health = max_health
    @alive = true
  end

  attr_accessor :health, :alive
  attr_reader :base_health_value, :base_attack_value, :character

  def attackable?
    true
  end

  def attack(target)
    target.take_damage(attack_value)
  end

  def take_damage(damage)
    self.health -= damage
    die if self.health < 0
  end

  def to_s
    character
  end

  def solid?
    true
  end

  private

  def max_health
    base_health_value
  end

  def attack_value
    base_attack_value
  end

  def die
    @map.empty_cell(self.coord)
    self.alive = false
  end

end
