module Rogue
  class UiHelper
    WINDOW_HEIGHT = 15
    WINDOW_WIDTH = 20

    def initialize(map:, player:, messages: [])
      @map = map
      @player = player
      @messages = messages
    end

    def draw
      output = ""
      output << game_window
      output << player_stats
      output << messages
      output
    end

    private

    def game_window
      string = ""
      area = area_around_player

      empty_cell = 
      (area[:y_lower_boundary]..area[:y_upper_boundary]).step  do |y|
        (area[:x_lower_boundary]..area[:x_upper_boundary]).step do |x|
          cell = @map.cell(Coordinate.new(x, y)) || NullCell.new
          if cell.wall? || VisionHelper.clear_path_between?(map: @map, source: @player, target: cell) 
            string << cell.to_s
          else
            string << "   "
          end
        end
        string << "\n"
      end 
      string
    end

    def player_stats
      "#{@player.name} the Player | health: #{@player.health}\n\n"
    end

    def messages
      string = ""
      @messages.last(3).each { |message| string << "#{message}\n" }
      string
    end

    def area_around_player
      x, y = @player.coord.x, @player.coord.y
      boundaries = {
        x_lower_boundary: x - WINDOW_WIDTH/2,
        x_upper_boundary: x + WINDOW_WIDTH/2,
        y_lower_boundary: y - WINDOW_HEIGHT/2,
        y_upper_boundary: y + WINDOW_HEIGHT/2
      }
      ensure_boundaries_are_within_map_bounds(boundaries)
    end

    def ensure_boundaries_are_within_map_bounds(boundaries)
      if boundaries[:x_lower_boundary] < 0
        boundaries[:x_upper_boundary] += boundaries[:x_lower_boundary] * -1
        boundaries[:x_lower_boundary] = 0
      end

      if boundaries[:x_upper_boundary] > @map.width
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
end
