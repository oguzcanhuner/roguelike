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
    # fill in the border and then fill in the rest 40% of the time
    @map.cells.each do |coords, cell|
      if coordinate_is_an_edge(*coords)
        @map.wall_cell(*coords)
      elsif coordinate_is_in_the_middle(*coords)
        @map.empty_cell(*coords)
      elsif rand <= 0.35
        @map.wall_cell(*coords)
      end
    end
  end

  def coordinate_is_in_the_middle(x, y)
    middle = (@map.width / 2).round
    y == middle
  end

  def coordinate_is_an_edge(x, y)
    x == 0 || 
    x == (@map.width - 1) || 
    y == 0 || 
    y == (@map.height - 1)
  end

  def number_of_adjacent_walls_around(cell)
    count = 0
    ((cell.x-1)..(cell.x+1)).step do |x|
      ((cell.y-1)..(cell.y+1)).step do |y|
        if @map.cell(x, y).wall?
          count += 1
        end
      end
    end
    count
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
    @map.cells.each do |coords, cell|
      if cell.wall? && number_of_adjacent_walls_around(cell) >= 4
        @map.wall_cell(*coords)
      elsif number_of_adjacent_walls_around(cell) >= 5
        @map.wall_cell(*coords)
      else
        @map.empty_cell(*coords)
      end
    end
  end
end
