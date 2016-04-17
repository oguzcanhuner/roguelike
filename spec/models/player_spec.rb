describe Player do
  let(:player) { Player.new }

  describe '#to_s' do
    it "has a unique character" do
      expect(player.to_s).to eql " @ "
    end
  end

  describe '#health' do
    it 'has a health' do
      expect(player.health).to eql 20
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(player.name).to eql "Oz"
    end
  end

  describe '#alive?' do

    before(:each) do
      player = Player.new
    end

    it 'should be alive when health is greater than 0' do
      expect(player).to be_alive
    end

    context 'should be dead when health is below or equal to 0' do
      it 'should be dead when health is 0' do
        player.health = 0
        expect(player).not_to be_alive
      end
      it 'should be dead when health is below 0' do
        player.health = -73
        expect(player).not_to be_alive
      end
    end
  end
end
