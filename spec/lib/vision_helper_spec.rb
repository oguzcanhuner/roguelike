describe Rogue::VisionHelper do
  describe "#clear_path_between?" do
    before do
      @map = Map.new(height: 5, width: 5)
      @player = Player.new
      @npc = NPC.new
      @map.populate_cell(Coordinate.new(0,3), @player)
      @map.populate_cell(Coordinate.new(4,3), @npc)
    end

    let(:helper) { Rogue::VisionHelper }

    it "returns true if there is a clear path between two cells on the map" do
      expect(helper.clear_path_between?(map: @map, source: @player, target: @npc)).to eql true
    end

    it "returns false if there is a wall blocking path between two cells on the map" do
      @map.wall_cell(Coordinate.new(2,3))
      expect(helper.clear_path_between?(map: @map, source: @player, target: @npc)).to eql false
    end
  end
end
