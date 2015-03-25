require 'spec_helper'

describe Player do
  let(:cell) { Cell.new(1, 5) }
  let(:player) { Player.new }

  context 'given a valid cell' do
    it 'has coordinates corresponding to the parent cell' do
      player.cell = cell
      expect(player.coords).to eq [1, 5]
    end
  end
end
