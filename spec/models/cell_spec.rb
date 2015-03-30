require 'spec_helper'

describe Cell do
  let(:cell) { Cell.new(5, 4) } 

  it 'has an x position' do
    expect(cell.x).to eq 5
  end
  it 'has a y position' do
    expect(cell.y).to eq 4
  end

  it 'has coordinates' do
    expect(cell.coords).to eq [5, 4]
  end

  it 'initializes with an empty cell' do
    expect(cell.content).to be_kind_of EmptyCell
  end

  it 'takes an optional content parameter' do
    Cell.new(5, 5, content: double(:player_cell))
  end

  describe '#to_s' do
    let(:empty_cell) { Cell.new(1,1, content: EmptyCell.new) }

    it 'returns the character representation of the cell contents' do
      expect(empty_cell.to_s).to eq " . "
    end
  end
end
