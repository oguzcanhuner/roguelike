class NpcPhase < Phase

  def perform
    @npcs.collect { |npc| npc if npc.alive? }.compact.each do |npc|
      if npc.coord.adjacent?(@game.player.coord)
        npc.attack(@player)
      else
        npc.move(direction: [:left, :right, :up, :down].sample)
      end
    end
  end
end
