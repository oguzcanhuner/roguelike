require 'spec_helper'

describe Grid do
  let(:grid) {Grid.new}

  describe '#cells' do
    subject(:cells) { grid.cells }

    it{ is_expected.to be_kind_of Array}

    context 'given a 5 by 5 grid' do
      let(:cells) { grid.cells(x: 5, y: 5) }

      it 'has a size of 25' do
        expect(cells.size).to eq 25
      end
    end
  end
end
