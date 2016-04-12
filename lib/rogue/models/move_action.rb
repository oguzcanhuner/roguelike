module MoveAction
  def move(direction)
    target_cell = @map.cell(@player.coord.send(direction))
    @game.add_message("Player moved #{ direction.to_s}")
    @player.move(direction: direction)

    new_phase = PlayerPhase.new
    new_phase.last_action = :attack
    new_phase
  end
end
