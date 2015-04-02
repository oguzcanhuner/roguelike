class MapGenerator
  def initialize(map: map)
    @map = map
  end

  def generate_cave
    random_fill
    4.times do
      apply_4_5_method
    end
  end

  private
  def random_fill
    @map.cells.each do |coords, cell|
      @map.wall_cell(*coords) if rand <= 0.4
    end
  end

  # this method uses a cellular automata inspired algorithm to create
  # a cavern-like structe
  # the rules are:
  # if an empty cell has 4 or more walls around it, it becomes a wall
  #   - otherwise, it stays empty
  # if a walled cell has 5 or more walls around it, it becomes a wall
  #   - otherwise, it becomes empty
  # http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels
  def apply_4_5_method
  end
end
