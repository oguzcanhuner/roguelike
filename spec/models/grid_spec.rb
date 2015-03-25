require 'spec_helper'

describe Grid do
  context 'given a 5 by 5 grid' do
    let(:grid) {Grid.new(height: 5, width: 5)}
    let(:empty_cell) { EmptyCell.new }

    describe '#cell' do
      it 'grants access to cells through coordinates' do
        expect(grid.cell(1,1)).to be_kind_of Cell
      end
    end

    describe '#populate_cell' do
      it 'updates an existing cell in the grid' do
        player = Player.new
        cell = grid.populate_cell(1, 1, player)

        expect(grid.cell(1, 1).content).to eq player
        expect(player.cell).to eq cell
      end
    end

    describe '#empty_cell' do
      it 'adds an empty cell to the coordinates given' do
        cell = grid.empty_cell(1, 1)

        expect(grid.cell(1, 1).content).to be_kind_of EmptyCell
      end
    end

    describe '#draw' do
      let(:output) { grid.draw }
      it 'returns a graphical representation of the grid' do
        expected = <<-BOARD
 .  .  .  .  . 
 .  .  .  .  . 
 .  .  .  .  . 
 .  .  .  .  . 
 .  .  .  .  . 
        BOARD

        expect(output).to eq expected
      end
    end
  end
end
