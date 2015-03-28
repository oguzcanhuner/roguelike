require 'spec_helper'

describe Map do
  context 'given a 5 by 5 map' do
    let(:map) {Map.new(height: 5, width: 6)}
    let(:empty_cell) { EmptyCell.new }

    describe '#cell' do
      it 'grants access to cells through coordinates' do
        expect(map.cell(1,1)).to be_kind_of Cell
      end
    end

    describe '#populate_cell' do
      it 'updates an existing cell in the map' do
        player = CellContent::Player.new
        cell = map.populate_cell(1, 3, player)

        expect(map.cell(1, 3).content).to eq player
        expect(player.cell).to eq cell
      end
    end

    describe '#empty_cell' do
      it 'adds an empty cell to the coordinates given' do
        cell = map.empty_cell(1, 1)

        expect(map.cell(1, 1).content).to be_kind_of EmptyCell
      end
    end

    describe '#draw' do
      let(:output) { map.draw }
      it 'returns a graphical representation of the map' do
        expected = <<-BOARD
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        BOARD

        expect(output).to eq expected
      end
    end
  end
end
