module MoveAction
  def move(direction)
    @game.add_message("Player moved #{ direction.to_s}")
    @player.move(direction: direction)

    PlayerPhase.new({last_action: __method__})
  end
end
