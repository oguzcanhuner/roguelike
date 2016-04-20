class Phase
  def initialize(game: Rogue.game, last_action: nil)
    @game = game
    @player = game.player
    @map = game.map
    @action = :move
    @last_action = last_action
    @npcs = @game.npcs
  end

  attr_accessor :last_action

  def keys
    raise "Implement this"
  end

  def directions
    {
      'h' => :left,
      'j' => :down,
      'k' => :up,
      'l' => :right,
      'u' => :topleft,
      'i' => :topright,
      'n' => :bottomleft,
      'm' => :bottomright
    }
  end

  def perform(key)
    send_command(key)
  end

  def send_command(key)
    if directions[key]
      yield if block_given?
      self.send(@action, directions[key])
    elsif keys[key]
      self.send(*keys[key])
    else
      self
    end
  end
end

class PlayerPhase < Phase
  include MoveAction
  include AttackAction

  def keys
    {'a' => :start_attack}
  end

  def perform(key)
    send_command(key) do
      target_cell = @map.cell(@player.coord.send(directions[key]))
      @action = :attack if target_cell.attackable?
    end
  end

  private

  def start_attack
    AttackPhase.new({last_action: __method__})
  end
end

class AttackPhase < Phase
  include AttackAction

  def initialize(game: Rogue.game, last_action: nil)
    super
    @action = :attack
  end

  def keys
    {'q' => :cancel}
  end

  private

  def cancel
    PlayerPhase.new({last_action: __method__})
  end
end
