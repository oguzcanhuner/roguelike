require 'spec_helper'

describe Player do
  let(:entity) { InteractiveEntity.new(movement_helper: double(:movement_helper)) }
  let(:player) { Player.new(entity) }

  describe '#to_s' do
    it "has a character" do
      expect(player.to_s).to eql " @ "
    end
  end
end
