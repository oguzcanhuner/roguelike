class Grid
  def cells(x: 3, y: 3)
    collection = []

    x.times do |hor|
      y.times do |ver|
        collection << 0
      end
    end

    collection
  end
end
