require 'spec_helper'

describe NPC do
  let(:npc) { NPC.new(movement_helper: double(:movement_helper)) }
  let(:cell) { Cell.new(0,0) }

  it 'has a character' do
    expect(npc.to_s).to eq " D "
  end

  describe '#coords' do
    it 'has coordinates' do
      npc.cell = cell
      expect(npc.coords).to eq [0, 0]
    end
  end
end
