module Rogue
  module Fighter
    attr_accessor :health, :alive
    attr_reader :max_health, :max_attack

    # if you can fight, then you can get attacked!
    def attackable?
      true
    end

    def attack(target)
      target.take_damage(max_attack)
    end

    def take_damage(damage)
      self.health -= damage
      die if self.health < 0
    end

    private

    def die
      Rogue.map.empty_cell(self.coord)
      self.alive = false
    end
  end
end
