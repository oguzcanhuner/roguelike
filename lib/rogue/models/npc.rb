class NPC 

  def initialize
    @character = " D "
    @max_health = 10
    @max_attack = 3
    @health = max_health
  end

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end
end
