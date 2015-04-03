require 'spec_helper'

describe UiHelper do
  it 'initializes with a map and a player' do
    UiHelper.new(map: double(:map), player: double(:player))
  end

  describe '#draw' do
    describe 'returning a string representation of the map' do
      let(:map) { Map.new }
      let(:game) { Game.new(map: map) }
      let(:environment) { game.setup }
      let(:player) { environment.fetch(:player) }

      let!(:helper) { UiHelper.new(map: map, player: player) }
      
      it 'outputs a map as a string' do
        expect(helper.draw).to be_a String
      end

      it 'outputs the player' do
        expect(helper.draw).to include "@"
      end
    end
  end
end
