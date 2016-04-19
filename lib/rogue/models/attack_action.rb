module AttackAction
  def attack(direction)
    target_cell = @map.cell(@player.coord.send(direction))
    if target_cell.attackable?
      @game.add_message("Player attacked #{ target_cell.content.class }")
      @player.attack(target_cell.content)
    else
      @game.add_message("Player attacked thin air")
    end

    PlayerPhase.new({last_action: __method__})
  end
end
