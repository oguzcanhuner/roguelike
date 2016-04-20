class NpcPhase < Phase

  def perform
    @npcs.collect { |npc| npc if npc.alive? }.compact.each do |npc|
      if npc.coord.adjacent?(@game.player.coord)
        npc.attack(@player)
      else
        npc.move(direction: random_direction )
      end
    end
  end

  private
  def random_direction
    [:left, :right, :up, :down, :topleft, 
     :topright, :bottomleft, :bottomright].sample
  end
end
