require 'spec_helper'

describe Game do
  let(:game) { Game.new }

  describe '#setup' do
    it 'returns instances of a map and a player' do
      expect(game.setup.keys).to eq [:map, :player]
    end

    it 'adds a player to the map' do
      map = game.setup.fetch(:map)
      expect(map.cells.find{ |i, c| c.content.class == Player }).to be_truthy
    end

  end

  describe "#step" do
    context 'player movement' do
      let(:environment) { game.setup }
      let(:map) { environment.fetch(:map) }
      let(:player) { environment.fetch(:player) }

      it 'moves the player one step to the left' do
        expect{ game.step('h') }.to change{
          player.coords
        }
      end

      it 'moves the player one step to the right' do
        initial_position =  map.cells.find{ |i, c| c.content.class == Player }[1].coords 
        new_map = game.step('l')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0] + 1, initial_position[1]]
        expect( new_map.cell(*new_position).content).to be_kind_of Player
      end

      it 'moves the player one step down' do
        initial_position =  map.cells.find{ |i, c| c.content.class == Player }[1].coords 
        new_map = game.step('j')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0], initial_position[1] + 1]
        expect( new_map.cell(*new_position).content).to be_kind_of Player
      end

      it 'moves the player one step up' do
        initial_position =  map.cells.find{ |i, c| c.content.class == Player }[1].coords 
        new_map = game.step('k')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0], initial_position[1] - 1]
        expect( new_map.cell(*new_position).content).to be_kind_of Player
      end
    end
  end
end
