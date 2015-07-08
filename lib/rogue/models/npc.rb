class NPC 

  def initialize
    @character = " D "
    @max_health = 20
    @max_attack = 5
    @health = max_health
    @alive = true
  end

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end
end
