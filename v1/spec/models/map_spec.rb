require 'spec_helper'

describe Map do
  context 'given a 5 by 5 map' do
    let(:map) {Map.new(height: 5, width: 6)}
    let(:empty_cell) { EmptyCell.new }
    let(:player) { Player.new }
    let(:coordinate) { Coordinate.new(1, 2) }

    describe '#cell' do
      it 'grants access to cells through coordinates' do
        expect(map.cell(coordinate)).to be_kind_of Cell
      end
    end

    describe '#populate_cell' do
      it 'updates an existing cell in the map' do
        cell = map.populate_cell(coordinate, player)

        expect(map.cell(coordinate).content).to eq player
        expect(player.cell).to eq cell
      end
    end

    describe '#empty_cell' do
      it 'adds an empty cell to the coordinates given' do
        cell = map.empty_cell(coordinate)

        expect(map.cell(coordinate).content).to be_kind_of EmptyCell
      end
    end

    describe '#move_object' do
      let(:start_coord) { Coordinate.new(1, 1) }

      before do
        map.populate_cell(start_coord, player)
      end

      it 'moves a cell content from one coordinate to another' do
        expect{map.move_object(from: start_coord, to: start_coord.up)}.to change{
          map.cell(start_coord).content
        }
      end

      context 'when the destination cell doesnt exist' do
        it 'doesnt move' do
          expect{map.move_object(from: start_coord, to: Coordinate.new(-1, 0))}.not_to change{
            map.cell(start_coord).content
          }
        end
      end
    end
  end
end
