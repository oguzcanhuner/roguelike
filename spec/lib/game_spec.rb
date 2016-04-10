describe Rogue::Game do
  before { Rogue.initialize }
  let(:game) { Rogue.game }
  let(:map) { game.map }
  let(:player) { game.player }

  describe "#step" do
    context 'player movement' do

      before do
        move_player_to_map_center
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

      let(:npc) { game.npcs[0] }

      before do
        move_player_to_map_center
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
    end
  end

  def move_player_to_map_center
    map.move_object(from: player.coord, to: Coordinate.new(5,5))
  end
end
