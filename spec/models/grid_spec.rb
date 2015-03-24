require 'spec_helper'

describe Grid do
  context 'given a 5 by 5 grid' do
    let(:grid) {Grid.new(x: 5, y: 5)}

    describe '#cells' do
      let(:cells) { grid.cells }
      it 'is a list' do
        expect(cells).to be_kind_of Array
      end

      it 'has a size of 25' do
        expect(cells.size).to eq 25
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
