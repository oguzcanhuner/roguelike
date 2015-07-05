class PlayerPhase
  KEYS = {
    'h' => [:move_or_attack, :left],
    'j' => [:move_or_attack, :down],
    'k' => [:move_or_attack, :up],
    'l' => [:move_or_attack, :right]
  }

  def initialize(game:)
    @game = game
    @player = game.player
    @map = game.map
  end

  def perform(key)
    if KEYS[key]
      self.send(*KEYS[key])
    end
  end

  private

  def move_or_attack(direction)
    target_cell = @map.cell(@player.coord.send(direction))

    if target_cell.attackable?
      @player.attack(target_cell.content)
      @game.add_message("Player attacked #{ target_cell.content.class }")
    else
      @player.move(direction: direction)
      @game.add_message("Player moved #{ direction.to_s}")
    end

  end
end
