require 'spec_helper'

describe Game do
  let(:game) { Game.new }

  describe '#setup' do

    let!(:map) { game.setup }
    it 'creates a map' do
      expect(map).to be_kind_of Map
    end

    it 'adds a player to the map' do
      expect(map.cells.find{ |i, c| c.content.class == CellContent::Player }).to be_truthy
    end
  end

  describe "#step" do
    context 'player movement' do
      let!(:map) { game.setup }

      it 'moves the player one step to the left' do
        initial_position = map.cells.find{ |i, c| c.content.class == CellContent::Player }[1].coords
        new_map = game.step('h')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0] - 1, initial_position[1]]
        expect( new_map.cell(*new_position).content).to be_kind_of CellContent::Player
      end

      it 'moves the player one step to the right' do
        initial_position = map.cells.find{ |i, c| c.content.class == CellContent::Player }[1].coords
        new_map = game.step('l')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0] + 1, initial_position[1]]
        expect( new_map.cell(*new_position).content).to be_kind_of CellContent::Player
      end

      it 'moves the player one step down' do
        initial_position = map.cells.find{ |i, c| c.content.class == CellContent::Player }[1].coords
        new_map = game.step('j')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0], initial_position[1] + 1]
        expect( new_map.cell(*new_position).content).to be_kind_of CellContent::Player
      end

      it 'moves the player one step up' do
        initial_position = map.cells.find{ |i, c| c.content.class == CellContent::Player }[1].coords
        new_map = game.step('k')

        expect( new_map.cell(*initial_position).content ).to be_kind_of EmptyCell
        new_position = [initial_position[0], initial_position[1] - 1]
        expect( new_map.cell(*new_position).content).to be_kind_of CellContent::Player
      end
    end
  end
end
