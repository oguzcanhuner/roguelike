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
      @game.add_message("Player attacked #{ target_cell.content.class }")
      @player.attack(target_cell.content)
    else
      @game.add_message("Player moved #{ direction.to_s}")
      @player.move(direction: direction)
    end

  end
end
