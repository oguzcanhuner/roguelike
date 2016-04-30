# An entity decorator class
class Player
  def initialize
    @name = "Oz"
    @character = " @ "
    @max_health = 20
    @max_attack = 5
    @health = max_health
    @vision = 5
  end

  attr_reader :name, :vision

  include Rogue::Mover
  include Rogue::Fighter

  def to_s
    @character
  end

  def can_see?(cell)
    vision_helper = Rogue::VisionHelper
    low_x, upper_x = (self.coord.x - vision), (self.coord.x + vision)
    low_y, upper_y = (self.coord.y - vision), (self.coord.y + vision)

    cell_visible = cell.x.between?(low_x, upper_x) && cell.y.between?(low_y, upper_y)
    path_clear = vision_helper.clear_path_between?(map: Rogue.map, source: self, target: cell) 

    if cell_visible && path_clear
      cell.discover!
      return true
    else
      return false
    end
  end
end
