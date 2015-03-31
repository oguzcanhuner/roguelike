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

  private

  def area_around_player
    x, y = @player.coords
    {
      x_lower_boundary: x - WINDOW_WIDTH/2,
      x_upper_boundary: x + WINDOW_WIDTH/2,
      y_lower_boundary: y - WINDOW_HEIGHT/2,
      y_upper_boundary: y + WINDOW_HEIGHT/2
    }
  end
end
