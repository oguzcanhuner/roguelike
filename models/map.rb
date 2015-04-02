class Map
  def initialize(height: 10, width: 10)
    @height = height
    @width = width
    @cells = initialize_cells
  end

  attr_reader :height, :width, :cells

  def cell(x, y)
    @cells[[x, y]] || NullCell.new
  end

  def populate_cell(x, y, content)
    cell = @cells[[x, y]]
    cell.content = content
    content.cell = cell
  end

  def empty_cell(x, y)
    @cells[[x, y]].content = EmptyCell.new
  end

  def wall_cell(x, y)
    @cells[[x, y]].content = Wall.new
  end

  def move_object(from:, to:)
    if cell(*to).passable?
      object = cell(*from).content
      populate_cell(*to, object)
      empty_cell(*from)
    end
  end

  private
  def initialize_cells
    collection = {}

    height.times do |y_pos|
      width.times do |x_pos|
        collection[[x_pos, y_pos]] = Cell.new(x_pos, y_pos)
      end
    end

    collection
  end
end
