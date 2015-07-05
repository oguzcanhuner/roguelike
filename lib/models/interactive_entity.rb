class InteractiveEntity < Entity
  def initialize(map:)
    @map = map
    @base_health_value = 20
    @base_attack_value = 5
    @health = max_health
    @alive = true
  end

  attr_accessor :cell, :health, :alive
  attr_reader :base_health_value, :base_attack_value

  def coord
    cell.coord
  end

  def move(direction:)
    @map.move_object(from: coord, to: coord.send(direction))
  end

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
