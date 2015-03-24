class Grid
  def initialize(x: 10, y: 10)
    @x = x
    @y = y
    @cells = cells
  end

  attr_reader :x, :y, :cells

  def draw
    board = ""
    x.times do |x_pos|
      y.times do |y_pos|
        board << cell(x_pos, y_pos).character
      end
      board << "\n"
    end
    board
  end

  def cell(x, y)
    cells[[x, y]]
  end

  private
  def cells
    collection = {}

    x.times do |x_pos|
      y.times do |y_pos|
        collection[[x_pos, y_pos]] = Cell.new(x_pos, y_pos)
      end
    end

    collection
  end
end
