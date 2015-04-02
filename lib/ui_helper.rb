class UiHelper
  WINDOW_HEIGHT = 10
  WINDOW_WIDTH = 12

  def initialize(map:, player:)
    @map = map
    @player = player
  end

  def draw
    output = ""

    area = area_around_player

    (area[:y_lower_boundary]..area[:y_upper_boundary]).step  do |y|
      (area[:x_lower_boundary]..area[:x_upper_boundary]).step do |x|
        output << (@map.cell(x, y) || NullCell.new).to_s
      end
      output << "\n"
    end 
    output
  end

  def draw_whole_map
    output = ""
    (WINDOW_HEIGHT).times do |y|
      (WINDOW_WIDTH).times do |x|
        output << @map.cell(x, y).to_s
      end
      output << "\n"
    end 
    output
  end

  private

  def area_around_player
    x, y = @player.coords
    boundaries = {
      x_lower_boundary: x - WINDOW_WIDTH/2,
      x_upper_boundary: x + WINDOW_WIDTH/2,
      y_lower_boundary: y - WINDOW_HEIGHT/2,
      y_upper_boundary: y + WINDOW_HEIGHT/2
    }
    normalize_boundaries(boundaries)
  end

  def normalize_boundaries(boundaries)
    if boundaries[:x_lower_boundary] < 0
      boundaries[:x_upper_boundary] += boundaries[:x_lower_boundary] * -1
      boundaries[:x_lower_boundary] = 0
    end

    if boundaries[:x_upper_boundary] >= @map.width
      boundaries[:x_lower_boundary] -= (boundaries[:x_upper_boundary] - @map.width)
      boundaries[:x_upper_boundary] = @map.width
    end

    if boundaries[:y_lower_boundary] < 0
      boundaries[:y_upper_boundary] += boundaries[:y_lower_boundary] * -1
      boundaries[:y_lower_boundary] = 0
    end

    if boundaries[:y_upper_boundary] > @map.height
      boundaries[:y_lower_boundary] -= boundaries[:y_upper_boundary] - @map.height
      boundaries[:y_upper_boundary] = @map.height
    end

    boundaries
  end
end
