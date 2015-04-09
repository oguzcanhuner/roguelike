require 'spec_helper'

describe NPC do
  let(:entity) { InteractiveEntity.new(map: double(:map)) }
  let(:npc) { NPC.new(entity) }

  describe "#to_s" do
    it 'has a unique character' do
      expect(npc.to_s).to eq " D "
    end
  end
end
