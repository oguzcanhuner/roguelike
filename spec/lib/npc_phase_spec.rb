module Rogue
  class << self
    def initialize
      @map = Map.new(height: 10, width: 10)
      @game = Game.new(map: map, number_of_npcs: 1)
    end
  end
end

describe NpcPhase do
  before { Rogue.initialize }
  let(:game) { Rogue.game }
  let(:map) { game.map }
  let(:player) { game.player }
  let(:npc) { game.npcs[0] }

  let(:helper) { Rogue::UiHelper.new(map: map, player: player) } #will help debugging tests

  describe '#perform' do
    before(:each) do
      reset_map
    end

    it 'should move NPCS randomly when no players are nearby' do
      expect(npc).to receive(:move)
      game.step('l')
    end

    it 'should make NPCS attack the player when nearby' do
      map.move_object(from: npc.coord, to: Coordinate.new(5,6))
      expect(npc).to receive(:attack)
      game.step('j')
    end
  end

  def reset_map
    map.move_object(from: player.coord, to: Coordinate.new(5,5))
    map.move_object(from: npc.coord, to: Coordinate.new(0,0))
  end
end
