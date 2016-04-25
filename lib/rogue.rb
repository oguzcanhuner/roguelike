require 'require_all'
require_all 'lib'

module Rogue
  class << self
    def initialize
      @map = Map.new(height: 100, width: 150)
      map_generator = MapGenerator.new(map: @map)
      map_generator.generate_cave

      @game = Game.new(map: map)
    end
    attr_reader :map, :game
  end
end
