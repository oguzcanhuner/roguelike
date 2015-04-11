class MovementPhase
  KEYS = {
    'h' => [:move_player, :left],
    'j' => [:move_player, :down],
    'k' => [:move_player, :up],
    'l' => [:move_player, :right],
    'a' => [:start_attack]
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

  private

  def move_player(direction)
    @player.move(direction: direction)
    @game.add_message("Player moved #{ direction.to_s}")
  end

  def start_attack
    @game.add_message("Pick a direction to attack in")
    @game.attack
  end
end
