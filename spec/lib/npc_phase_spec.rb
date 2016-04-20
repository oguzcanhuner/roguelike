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

    it 'should make NPCS attack the player when nearby' do
      map.move_object(from: npc.coord, to: Coordinate.new(5,6))
      expect(npc).to receive(:attack)
      game.step('j')
    end

    it 'should make NPCS attack the player when diagonal' do
      map.move_object(from: npc.coord, to: Coordinate.new(4,4))
      expect(npc).to receive(:attack)
      game.step('u')
    end

    it 'should move NPCs towards the player in a straight line if not adjacent' do
      map.move_object(from: npc.coord, to: Coordinate.new(5,1))
      expect(npc).to receive(:move).with(direction: :down)
      game.step('k')
    end

    it 'should move NPCs towards the player diagonally if not adjacent' do
      map.move_object(from: npc.coord, to: Coordinate.new(2,2))
      expect(npc).to receive(:move).with(direction: :bottomright)
      game.step('k')
    end
  end

  def reset_map
    npc.health = npc.max_health
    player.health = player.max_health
    map.move_object(from: player.coord, to: Coordinate.new(5,5))
    map.move_object(from: npc.coord, to: Coordinate.new(0,0))
  end
end
