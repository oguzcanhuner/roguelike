class NpcPhase < Phase

  def perform
    @npcs.collect { |npc| npc if npc.alive? }.compact.each do |npc|
      if npc.coord.adjacent?(@game.player.coord)
        @game.add_message("#{npc.class} attacked Player")
        npc.attack(@player)
      else
        helper = Rogue::VisionHelper
        if helper.clear_path_between?(map: @map, source: npc, target: @player)
          npc.move(direction: AI.follow_direction(npc.coord, @player.coord))
        end
      end
    end
  end

  private

  def random_direction
    Coordinate::DIRECTIONS.sample
  end
end
