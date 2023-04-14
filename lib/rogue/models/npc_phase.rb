class NpcPhase < Phase

  def perform
    @npcs.collect { |npc| npc if npc.alive? }.compact.each do |npc|
      if npc.coord.adjacent?(@game.player.coord)
        info = npc.attack(@player)
        case info
        when HitInfo
          @game.add_message("#{npc.class} attacked Player for #{ info.damage }")
        when DodgeInfo
          @game.add_message("Player dodged #{npc.class} attack!")
        end
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
