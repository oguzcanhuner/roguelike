require 'spec_helper'

describe Mover do
  let(:grid) { Grid.new(height: 10, width: 10) }
  let(:player) { CellContent::Player.new }
  let(:mover) { Mover.new(grid, player) }


  describe '#move' do
    context 'given a valid direction' do
      before { grid.populate_cell(1, 0, player) }

      it 'moves a content in said direction' do
        expect{ mover.move(:left) }.to change {
          player.coords
        }.from([1,0]).to [0,0]
      end

      it 'empties the old cell' do
        expect{ mover.move(:left) }.to change {
          grid.cell(1, 0).content
        }.from( player ).to a_kind_of( EmptyCell )
      end

      it 'populates the new cell' do
        expect{ mover.move(:left) }.to change {
          grid.cell(0, 0).content
        }
      end
    end

    context 'given that there is no cell in the given direction' do
      before { grid.populate_cell(0, 0, player) }

      it 'does not move the player' do
        expect{ mover.move(:left) }.not_to change { player.coords }
      end

      it 'does not modify the grid' do
        expect{ mover.move(:left) }.not_to change { grid.cell(0, 0).content }
      end
    end
  end
end
