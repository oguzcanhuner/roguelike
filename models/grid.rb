class Grid
  def cells(x: 3, y: 3)
    collection = []

    x.times do |x_pos|
      y.times do |y_pos|
        collection << Cell.new(x: x_pos, y: y_pos)
      end
    end

    collection
  end
end
