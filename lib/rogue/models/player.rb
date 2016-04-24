# An entity decorator class
class Player
  def initialize
    @name = "Oz"
    @character = " @ "
    @max_health = 10000
    @max_attack = 5
    @health = max_health
  end

  attr_reader :name

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end
end
