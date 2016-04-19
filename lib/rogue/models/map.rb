class Map
  def initialize(height: 10, width: 10)
    @height = height
    @width = width
    @cells = initialize_cells
  end

  attr_reader :height, :width, :cells

  def cell(coord)
    @cells[coord] || NullCell.new
  end

  def populate_cell(coord, content)
    cell = @cells[coord]
    cell.content = content
    content.cell = cell
  end

  def populate_random_empty_cell(content)
    empty_cells = @cells.collect do |coord, cell|
      cell if cell.empty? 
    end.compact

    coord = empty_cells.sample.coord
    populate_cell(coord, content)
  end

  def empty_cell(coord)
    @cells[coord].content = EmptyCell.new
  end

  def wall_cell(coord)
    @cells[coord].content = Wall.new
  end

  def move_object(from:, to:)
    if cell(to).passable?
      object = cell(from).content
      populate_cell(to, object)
      empty_cell(from)
    end
  end

  private

  def initialize_cells
    collection = {}

    height.times do |y|
      width.times do |x|
        coord = Coordinate.new(x, y)
        collection[coord] = Cell.new(coord)
      end
    end
    collection
  end
end
