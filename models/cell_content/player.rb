module CellContent
  class Player
    def initialize
      @character = " @ "
      @cell = nil
    end

    attr_reader :character
    attr_accessor :cell

    def coords
      cell.coords
    end
  end
end
