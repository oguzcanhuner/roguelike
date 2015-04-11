class AttackPhase
  KEYS = {
    'h' => [:attack, :left],
    'j' => [:attack, :down],
    'k' => [:attack, :up],
    'l' => [:attack, :right],
    'q' => [:cancel]
  }

  def initialize(game, player:)
    @game = game
  end

  def perform(key)
    if KEYS[key]
      self.send(*KEYS[key])
    end
  end

  private

  def attack(direction)
    attack_cell = @player.coord.send(direction)
    target = attack_cell.content

    player.attack(target)
  end
end
