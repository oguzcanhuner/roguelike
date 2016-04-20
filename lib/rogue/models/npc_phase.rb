class NpcPhase < Phase

  def perform
    @npcs.collect { |npc| npc if npc.alive? }.compact.each do |npc|
      if npc.coord.adjacent?(@game.player.coord)
        @game.add_message("#{npc.class} attacked Player")
        npc.attack(@player)
      else
        npc.move(direction: npc.coord.direction_to_follow(@player.coord))
      end
    end
  end

  private
  def random_direction
    [:left, :right, :up, :down, :topleft, 
     :topright, :bottomleft, :bottomright].sample
  end
end
