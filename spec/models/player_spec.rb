require 'spec_helper'

describe Player do
  let(:cell) { Cell.new(1, 5) }
  let(:helper) { double(:movement_helper) }
  let(:player) { Player.new(movement_helper: helper) }

  describe '#coords' do
    context 'given a valid cell' do
      it 'has coordinates corresponding to the parent cell' do
        player.cell = cell
        expect(player.coords).to eq [1, 5]
      end
    end
  end

  describe '#move' do
    it 'uses a helper to move the player in the right direction' do
      expect(helper).to receive(:move)
      player.move(:left)
    end
  end
end
