class Grid
  def initialize(height: 10, width: 10)
    @height = height
    @width = width
    @cells = initialize_cells
  end

  attr_reader :height, :width, :cells

  def draw
    board = ""
    height.times do |y_pos|
      width.times do |x_pos|
        board << cell(x_pos, y_pos).character
      end
      board << "\n"
    end
    board
  end

  def cell(x, y)
    @cells[[x, y]]
  end

  def populate_cell(x, y, content)
    cell = @cells[[x, y]]
    cell.content = content
    content.cell = cell
  end

  def empty_cell(x, y)
    @cells[[x, y]].content = EmptyCell.new
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
