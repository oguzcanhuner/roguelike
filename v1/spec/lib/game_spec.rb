describe Rogue::Game do
  before { Rogue.initialize }
  let(:game) { Rogue.game }
  let(:map) { game.map }


  describe "#step" do
    context 'player movement' do
      let(:player) { game.player }

      before do
        # move the player to the middle of the map
        map.move_object(from: player.coord, to: Coordinate.new(5,5))
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
      it 'lets the player attack a cell' do
      end
    end
  end
end