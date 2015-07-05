require 'spec_helper'

describe Rogue::UiHelper do
  it 'initializes with a map and a player' do
    Rogue::UiHelper.new(map: double(:map), player: double(:player))
  end

  describe '#draw' do
    describe 'returning a string representation of the map' do
      let(:map) { Map.new }
      let(:game) { Rogue::Game.new(map: map) }
      let(:environment) { game.setup }
      let(:player) { environment.fetch(:player) }

      let!(:helper) { Rogue::UiHelper.new(map: map, player: player) }
      
      it 'outputs a map as a string' do
        expect(helper.draw).to be_a String
      end

      it 'outputs the player' do
        expect(helper.draw).to include "@"
      end

      it "outputs the player's name" do
        expect(helper.draw).to include "#{player.name} the Player"
      end

      it "outputs the player's name" do
        expect(helper.draw).to include "health: #{player.health}"
      end
    end
  end
end
