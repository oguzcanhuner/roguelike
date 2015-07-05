Dir["./lib/**/*.rb"].each { |f| require f }

module Rogue
  class << self
    def initialize
      @map = Map.new(height: 30, width: 40)
      map_generator = MapGenerator.new(map: @map)
      map_generator.generate_cave

      @game = Game.new(map: map)
      @game.setup
    end
    attr_reader :map, :game
  end
end
