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
        grid.cell(1, 0).content
      }.from( player ).to a_kind_of( EmptyCell )
    end
  end
end
