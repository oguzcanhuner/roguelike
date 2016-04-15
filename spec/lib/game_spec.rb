module Rogue
  class << self
    def initialize
      @map = Map.new(height: 10, width: 10)
      @game = Game.new(map: map, number_of_npcs: 1)
    end

    attr_reader :map, :game
  end
end

describe Rogue::Game do
  before { Rogue.initialize }
  let(:game) { Rogue.game }
  let(:map) { game.map }
  let(:player) { game.player }
  let(:npc) { game.npcs[0] }

  let(:helper) { Rogue::UiHelper.new(map: map, player: player) } #will help debugging tests

  describe "#step" do
    context 'player movement' do

      before(:each) do
        reset_map
      end

      it 'moves the player one step to the left' do
        expect(player).to receive(:move).with({direction: :left})
        game.step('h')
      end

      it 'moves the player one step to the right' do
        expect(player).to receive(:move).with({direction: :right})
        game.step('l')
      end

      it 'moves the player one step down' do
        expect(player).to receive(:move).with({direction: :down})
        game.step('j')
      end

      it 'moves the player one step up' do
        expect(player).to receive(:move).with({direction: :up})
        game.step('k')
      end
    end

    context 'attacking' do

      before(:each) do
        reset_map
      end

      it 'lets the player attack a cell with attackable content' do
        map.move_object(from: npc.coord, to: player.coord.up)
        expect(player).to receive(:attack).with(npc)
        game.step('a')
        game.step('k')
      end

      it 'does not allow attacking cells with unattackable content' do
        expect(player).not_to receive(:attack)
        game.step('a')
        game.step('k')
      end

      it 'attacks attackable cells without needing to manually initiate the attack phase' do
        map.move_object(from: npc.coord, to: player.coord.up)
        expect(player).to receive(:attack).with(npc)
        game.step('k')
      end

      it 'allows cancelling of attack phase without affecting map state' do
        expect(player).to receive(:move)
        game.step('a')
        game.step('q')
        game.step('k')
      end
    end
  end

  def reset_map
    map.move_object(from: player.coord, to: Coordinate.new(5,5))
    map.move_object(from: npc.coord, to: Coordinate.new(0,0))
  end

end
