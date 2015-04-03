require 'spec_helper'

describe MapGenerator do
  let(:map) { Map.new(height: 30, width: 60) }
  let(:generator) { MapGenerator.new(map: map) }

  describe '#create_cavern' do
    it 'creates a cavern-like structure'
  end
end
