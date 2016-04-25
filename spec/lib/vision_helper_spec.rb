describe Rogue::VisionHelper do
  it 'initializes with a map' do
    Rogue::VisionHelper.new(map: double(:map))
  end

  describe "#clear_path_between?" do
    before do
      @map = Map.new(height: 5, width: 5)
      @player = Player.new
      @npc = NPC.new
      @map.populate_cell(Coordinate.new(0,3), @player)
      @map.populate_cell(Coordinate.new(4,3), @npc)
    end

    it "returns true if there is a clear path between two cells on the map" do
      helper = Rogue::VisionHelper.new(@map)
      expect(helper.clear_path_between?(source: @player, target: @npc)).to eql true
    end

    it "returns false if there is a wall blocking path between two cells on the map" do
      @map.wall_cell(Coordinate.new(2,3))
      helper = Rogue::VisionHelper.new(@map)
      expect(helper.clear_path_between?(source: @player, target: @npc)).to eql false
    end
  end
end
