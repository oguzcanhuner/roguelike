require 'spec_helper'

describe Mover do
  let(:grid) { Grid.new }
  let(:player) { Player.new }
  let(:mover) { Mover.new(grid, player) }

  before do
    grid.populate_cell(1, 0, player)
  end

  context 'given a valid direction' do
    it 'moves a content in said direction' do
      expect{ mover.move(:left) }.to change {
        player.coords
      }.from([1,0]).to [0,0]
    end

    it 'empties the old cell' do
      expect{ mover.move(:left) }.to change {
        grid.cell(1, 0).content
      }.from( player ).to a_kind_of( EmptyCell )
    end

    it 'populates the new cell' do
      expect{ mover.move(:left) }.to change {
        grid.cell(0, 0).content
      }
    end
  end
end
