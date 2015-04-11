require 'spec_helper'

describe MapGenerator do
  let(:map) { Map.new(height: 30, width: 60) }
  let(:generator) { MapGenerator.new(map: map) }
end
