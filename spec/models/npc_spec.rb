describe NPC do
  let(:npc) { NPC.new }

  describe "#to_s" do
    it 'has a unique character' do
      expect(npc.to_s).to eq " D "
    end
  end

  describe '#health' do
    it 'has a health' do
      expect(npc.health).to eql 10
    end
  end
end
