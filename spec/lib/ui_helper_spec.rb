require 'spec_helper'

describe UiHelper do
  it 'initializes with a map' do
    UiHelper.new(map: double(:map))
  end

  describe '#draw' do
    let(:map) { Map.new(height: 3, width: 3) }
    let(:helper) { UiHelper.new(map: map) }

    it 'returns a string representation of the map' do
      expect(helper.draw).to eq(
<<BOARD
 .  .  . 
 .  .  . 
 .  .  . 
BOARD
      )
    end
  end
end
