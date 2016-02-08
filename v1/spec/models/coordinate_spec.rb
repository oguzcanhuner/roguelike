require 'spec_helper'

describe Coordinate do
  let(:coord) { Coordinate.new(6, 9) }

  describe '#new' do
    it 'initializes with an x and y coordinate' do
      Coordinate.new(1, 1)
    end
  end

  describe 'coordinates' do
    it 'has an x and y coordinate' do
      expect(coord.x).to eql 6
      expect(coord.y).to eql 9
    end
  end

  describe '#eql?' do
    it 'returns true when two coordinates have the same x and y values' do
      expect(Coordinate.new(1, 3)).to eql Coordinate.new(1, 3)
    end
  end

  describe '#hash' do
    it 'creates a unique key to allow hash key comparison using coordinate values' do
      hash = {}
      hash[Coordinate.new(1, 2)] = 1

      expect( hash[Coordinate.new(1, 2)] ).to eq 1
    end
  end

  describe '#up' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.up).to eql Coordinate.new(6, 8)
    end
  end
  describe '#down' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.down).to eql Coordinate.new(6, 10)
    end
  end
  describe '#left' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.left).to eql Coordinate.new(5, 9)
    end
  end
  describe '#right' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.right).to eql Coordinate.new(7, 9)
    end
  end
end
