class Phase
  def initialize(game: Rogue.game)
    @game = game
    @player = game.player
    @map = game.map
  end

  def keys
    raise "Implement this"
  end

  def perform(key)
    if keys[key]
      self.send(*keys[key])
    else
      self
    end
  end

  # most phases will stop the flow of the game (while an action is being taken)
  def lock_movements?
    true
  end
end

class PlayerPhase < Phase
  def keys
    {
      'h' => [:move_or_attack, :left],
      'j' => [:move_or_attack, :down],
      'k' => [:move_or_attack, :up],
      'l' => [:move_or_attack, :right],
      'a' => [:start_attack]
    }
  end

  def lock_movements?
    false
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

    self
  end

  def start_attack
    AttackPhase.new
  end
end

class AttackPhase < Phase
  def keys
    {
      'h' => [:attack, :left],
      'j' => [:attack, :down],
      'k' => [:attack, :up],
      'l' => [:attack, :right],
      'q' => [:cancel]
    }
  end

  def attack(direction)
    target_cell = @map.cell(@player.coord.send(direction))
    if target_cell.attackable?
      @game.add_message("Player attacked #{ target_cell.content.class }")
      @player.attack(target_cell.content)
    else
      @game.add_message("Player attacked thin air")
    end

    PlayerPhase.new
  end

  def cancel
    PlayerPhase.new
  end
end

