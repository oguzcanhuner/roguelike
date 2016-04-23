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

  DIRECTION_KEYS = [:h, :u, :k, :i, :l, :m, :j, :n]
  DIRECTION_KEYMAP = DIRECTION_KEYS.zip(Coordinate::DIRECTIONS).to_h

  def keys
    raise "Implement this"
  end

  def perform(key)
    send_command(key.to_sym)
  end

  def send_command(key)
    if DIRECTION_KEYMAP[key]
      yield if block_given?
      self.send(@action, DIRECTION_KEYMAP[key])
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
    send_command(key.to_sym) do
      target_cell = @map.cell(@player.coord.send(DIRECTION_KEYMAP[key.to_sym]))
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
