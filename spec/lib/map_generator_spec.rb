describe Rogue::MapGenerator do
  let(:map) { Map.new(height: 30, width: 60) }
  let(:generator) { Rogue::MapGenerator.new(map: map) }

  it 'should generate a map with a random cave' do
    generator.generate_cave
  end
end
