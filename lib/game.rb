class Game

  def setup
    @map = Map.new(height: 100, width: 100)
    @movement_helper = MovementHelper.new(map: @map)
    @map_generator = MapGenerator.new(map: @map)
    @map_generator.generate_cave
    @player = initialize_player
    @npcs = initialize_npcs
    { map: @map, player: @player }
  end

  def step(key)
    send(*(keys[key] || [:do_nothing]))
    npc_phase
    @map
  end

  private
  def keys
  {
    'h' => [:move_player, :left],
    'j' => [:move_player, :down],
    'k' => [:move_player, :up],
    'l' => [:move_player, :right],
  }
  end

  def do_nothing
  end

  def initialize_npcs
    npcs = []
    10.times do
      npc = NPC.new(movement_helper: @movement_helper)
      @map.populate_random_empty_cell(npc)
      npcs << npc
    end
    npcs
  end

  def initialize_player
    player = Player.new(movement_helper: @movement_helper)
    @map.populate_random_empty_cell(player)
    player
  end

  def move_player(direction)
    @player.move(direction: direction)
  end

  def npc_phase
    @npcs.each do |npc|
      npc.move(direction: [:left, :right, :up, :down].sample)
    end
  end

end
