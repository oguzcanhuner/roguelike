describe AI do
  let(:target_coord) { Coordinate.new(6, 9) }

  describe '#follow_direction' do
    it 'returns a direction that will move closer to another coordinate' do
      expect(AI.follow_direction(Coordinate.new(6, 7), target_coord)).to eq :down
      expect(AI.follow_direction(Coordinate.new(6, 11), target_coord)).to eq :up
      expect(AI.follow_direction(Coordinate.new(3, 9), target_coord)).to eq :right
      expect(AI.follow_direction(Coordinate.new(8, 9), target_coord)).to eq :left
      expect(AI.follow_direction(Coordinate.new(9, 15), target_coord)).to eq :topleft
      expect(AI.follow_direction(Coordinate.new(2, 15), target_coord)).to eq :topright
      expect(AI.follow_direction(Coordinate.new(9, 2), target_coord)).to eq :bottomleft
      expect(AI.follow_direction(Coordinate.new(2, 2), target_coord)).to eq :bottomright
    end
  end
end
