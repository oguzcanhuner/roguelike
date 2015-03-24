require 'spec_helper'

describe Grid do
  context 'given a 5 by 5 grid' do
    let(:grid) {Grid.new(x: 5, y: 5)}

    describe '#cell' do
      it 'grants access to cells through coordinates' do
        expect(grid.cell(1,1)).to be_kind_of Cell
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
