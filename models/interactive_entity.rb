class InteractiveEntity < Entity
  def initialize(map:)
    @map = map
    @base_health_value = 20
    @base_attack_value = 5
  end

  attr_accessor :cell
  attr_reader :base_health_value, :base_attack_value

  def coord
    cell.coord
  end

  def move(direction:)
    @map.move_object(from: coord, to: coord.send(direction))
  end
end
