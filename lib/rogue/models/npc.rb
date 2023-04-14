class NPC

  def initialize
    @character = " D "
    @max_health = 10
    @max_attack = 3
    @health = max_health

    # 5% - 15% dodge probability based on seed
    @dodge_probability = rand(0.05..0.15)
  end

  attr_reader :dodge_probability

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end
end
