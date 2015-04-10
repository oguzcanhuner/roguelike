class MovementPhase
  KEYS = {
    'h' => [:move_player, :left],
    'j' => [:move_player, :down],
    'k' => [:move_player, :up],
    'l' => [:move_player, :right]
  }

  def initialize(game, player:)
    @game = game
    @player = player
  end

  def perform(key)
    if KEYS[key]
      self.send(*KEYS[key])
    end
  end

  def move_player(direction)
    @player.move(direction: direction)
    @game.add_message("Player moved #{ direction.to_s}")
  end
end
