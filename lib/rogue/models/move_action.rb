module MoveAction
  def move(direction)
    target_cell = @map.cell(@player.coord.send(direction))
    @game.add_message("Player moved #{ direction.to_s}")
    @player.move(direction: direction)

    self
  end
end
