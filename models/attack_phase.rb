class AttackPhase
  KEYS = {
    'h' => [:attack, :left],
    'j' => [:attack, :down],
    'k' => [:attack, :up],
    'l' => [:attack, :right],
    'q' => [:cancel]
  }

  def initialize(args)
    @game = args.fetch(:game)
    @map = args.fetch(:map)
    @player = args.fetch(:player)
  end

  def perform(key)
    if KEYS[key]
      self.send(*KEYS[key])
    end
  end

  private

  def cancel
    @game.cancel_attack
    @game.messages << "Player cancelled attack"
  end

  def attack(direction)
    target_coord = @player.coord.send(direction)
    target = @map.cell(target_coord).content

    if @player.attack(target)
      @game.messages << "Player attacked #{target.class.to_s} for #{ @player.attack_value } damage"
    else
      @game.messages << "Player failed to attack"
    end
    @game.attack
  end
end
