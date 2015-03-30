require 'spec_helper'

describe UiHelper do
  it 'initializes with a map and a player' do
    UiHelper.new(map: double(:map), player: double(:player))
  end

  describe '#draw' do

    describe 'returning a string representation of the map' do
      let(:game) { Game.new }
      let(:environment) { game.setup }
      let(:player) { environment.fetch(:player) }
      let(:map) { environment.fetch(:map) }

      let!(:helper) { UiHelper.new(map: map, player: player) }

      it 'outputs the area around the player' do
        expect(helper.draw).to eq(
<<BOARD
 .  .  .  .  . 
 .  .  .  .  . 
 .  .  @  .  . 
 .  .  .  .  . 
 .  .  .  .  . 
BOARD
        )
      end

      context 'when the player is near the edge' do
        it 'outputs the area around the player' do
          5.times do
            game.step('h')
          end
          expect(helper.draw).to eq(
<<BOARD
 .  .  . 
 .  .  . 
 @  .  . 
 .  .  . 
 .  .  . 
BOARD
          )
        end
      end
    end
  end
end
