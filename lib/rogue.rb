require 'require_all'
require_all 'lib'

module Rogue
  class << self
    def initialize
      seed_rng!
      @map = Map.new(height: 100, width: 150)
      map_generator = MapGenerator.new(map: @map)
      map_generator.generate_cave

      @game = Game.new(map: map)
    end
    attr_reader :map, :game

    private

    def seed_rng!
      seed = ENV.fetch('RNG_SEED', rand(0..9999))
      Kernel.srand(Integer(seed))
    end
  end
end
