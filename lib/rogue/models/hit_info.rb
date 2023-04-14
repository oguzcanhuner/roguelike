class HitInfo
  def initialize(target, damage)
    @target = target
    @damage = damage
  end

  attr_reader :damage, :target
end
