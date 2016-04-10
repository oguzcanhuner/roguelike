class Phase
  def initialize(game: Rogue.game)
    @game = game
    @player = game.player
    @map = game.map
    @action = :move
    @keys = {}
  end

  def keys
    @keys
  end

  def directions
    {
        'h' => :left,
        'j' => :down,
        'k' => :up,
        'l' => :right
    }
  end

  def perform(key)
    if directions[key]
      target_cell = @map.cell(@player.coord.send(directions[key]))
      @action = :attack if target_cell.attackable?
      self.send(@action, directions[key])
    elsif keys[key]
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
  include MoveAction
  include AttackAction

  def initialize(game: Rogue.game)
    super
    keys['a'] = :start_attack
  end

  def lock_movements?
    false
  end

  private

  def start_attack
    AttackPhase.new
  end
end

class AttackPhase < Phase
  include AttackAction

  def initialize(game: Rogue.game)
    super
    keys['q'] = :cancel
    @action = :attack
  end

  def perform(key)
    if directions[key]
      self.send(@action, directions[key])
    else
      self
    end
  end

  def cancel
    PlayerPhase.new
  end
end

