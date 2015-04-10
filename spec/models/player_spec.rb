require 'spec_helper'

describe Player do
  let(:entity) { InteractiveEntity.new(map: double(:map)) }
  let(:player) { Player.new(entity) }

  describe '#to_s' do
    it "has a unique character" do
      expect(player.to_s).to eql " @ "
    end
  end
end
