require 'spec_helper'

describe NPC do
  let(:entity) { InteractiveEntity.new(movement_helper: double(:movement_helper)) }
  let(:npc) { NPC.new(entity) }

  describe "#to_s" do
    it 'has a unique character' do
      expect(npc.to_s).to eq " D "
    end
  end
end
