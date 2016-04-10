describe Rogue::MapGenerator do
  let(:map) { Map.new(height: 30, width: 60) }
  let(:generator) { Rogue::MapGenerator.new(map: map) }
end
