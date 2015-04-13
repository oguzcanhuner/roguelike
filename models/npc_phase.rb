class NpcPhase
  def initialize(game:, npcs:)
    @game = game
    @npcs = npcs
  end

  def perform
    @npcs.each do |npc|
      npc.move(direction: [:left, :right, :up, :down].sample)
    end
  end
end

