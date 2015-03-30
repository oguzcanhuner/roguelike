require 'spec_helper'

describe NPC do
  let(:npc) { NPC.new }
  let(:cell) { Cell.new(0,0) }
  describe '#coords' do
    it 'has a character' do
      expect(npc.to_s).to eq " D "
    end

    it 'has coordinates' do
      npc.cell = cell
      expect(npc.coords).to eq [0, 0]
    end
  end
end
