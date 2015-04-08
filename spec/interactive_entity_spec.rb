require 'spec_helper'

# A class which provides additional functionality to the base entity class
describe InteractiveEntity do
  let(:cell) { Cell.new(1, 5) }
  let(:helper) { double(:movement_helper) }
  let(:entity) { InteractiveEntity.new(movement_helper: helper) }

  describe '#coords' do
    context 'given a valid cell' do
      it 'has coordinates corresponding to the parent cell' do
        entity.cell = cell
        expect(entity.coords).to eq [1, 5]
      end
    end
  end

  describe '#move' do
    it 'uses a helper to move the player in the right direction' do
      expect(helper).to receive(:move)
      entity.move(:left)
    end
  end
end
