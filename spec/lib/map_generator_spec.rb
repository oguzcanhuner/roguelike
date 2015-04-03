require 'spec_helper'

describe MapGenerator do
  let(:map) { Map.new(height: 30, width: 60) }
  let(:generator) { MapGenerator.new(map: map) }

  describe '#create_cavern' do
    it 'creates a cavern-like structure' do
      ui = UiHelper.new(map: map, player: double(:player))
      generator.generate_cave
      map = ui.draw_whole_map
    end
  end
end
