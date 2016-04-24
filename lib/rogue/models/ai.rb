module AI
  FOLLOW_DIRECTIONS = {
      :topleft_of? => :bottomright, :topright_of? => :bottomleft,
      :bottomleft_of? => :topright, :bottomright_of? => :topleft,
      :left_of? => :right, :right_of? => :left, :above? => :down, :below? => :up
  }

  def self.follow_direction(base_coord, target_coord)
    FOLLOW_DIRECTIONS.keys.each do |relation|
      return FOLLOW_DIRECTIONS[relation] if base_coord.send(relation, target_coord)
    end
    false
  end
end
