module Rogue
  module Fighter
    attr_accessor :health
    attr_reader :max_health, :max_attack

    # if you can fight, then you can get attacked!
    def attackable?
      true
    end

    def alive?
      health > 0
    end

    def attack(target)
      return MissInfo.new(target)  if !target.attackable?
      return DodgeInfo.new(target) if target.dodge?

      HitInfo.new(target, target.take_damage!(max_attack))
    end

    def take_damage!(damage)
      self.health -= damage
      die unless alive?
      damage
    end

    def dodge?
      rand <= dodge_probability
    end

    private

    def die
      Rogue.map.empty_cell(self.coord)
    end
  end
end
