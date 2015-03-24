class Grid
  def initialize(x: 10, y: 10)
    @x = x
    @y = y
  end

  attr_reader :x, :y

  def cells
    collection = []

    x.times do |x_pos|
      y.times do |y_pos|
        collection << Cell.new(x_pos, y_pos)
      end
    end

    collection
  end

  def draw
    board = ""
    x.times do |x_pos|
      y.times do |y_pos|
        board << " . "
      end
      board << "\n"
    end
    board
  end
end
