module AttackAction
  def attack(direction)
    target_cell = @map.cell(@player.coord.send(direction))
    info = @player.attack(target_cell.content)

    case info
    when DodgeInfo
      @game.add_message("#{ info.target.class } dodged attack!")
    when HitInfo
      @game.add_message("Player attacked #{ info.target.class } for #{ info.damage }")
    when MissInfo
      @game.add_message("Player attacked thin air")
    end

    PlayerPhase.new({last_action: __method__})
  end
end
