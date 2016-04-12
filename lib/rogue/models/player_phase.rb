class Phase
  def initialize(game: Rogue.game)
    @game = game
    @player = game.player
    @map = game.map
    @action = :move
    @keys = {}
  end

  attr_accessor :last_action, :keys

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

end

class PlayerPhase < Phase
  include MoveAction
  include AttackAction

  def initialize(game: Rogue.game)
    super
    keys['a'] = :start_attack
  end

  private

  def start_attack
    new_phase = AttackPhase.new
    new_phase.last_action = :start_attack
    new_phase
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
    elsif keys[key]
      self.send(*keys[key])
    else
      self
    end
  end

  def cancel
    new_phase = PlayerPhase.new
    new_phase.last_action = :cancel
    new_phase
  end
end

