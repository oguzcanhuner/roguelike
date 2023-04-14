# An entity decorator class
class Player
  def initialize
    @name = "Oz"
    @character = " @ "
    @max_health = 20
    @max_attack = 5
    @health = max_health

    # 5% - 20% dodge probability based on seed
    @dodge_probability = rand(0.05..0.20)
  end

  attr_reader :name, :dodge_probability

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end
end
