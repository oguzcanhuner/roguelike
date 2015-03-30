class UiHelper
  def initialize(map:)
    @map = map
  end

  def draw
    output = ""
    @map.height.times do |y|
      @map.width.times do |x|
        output << @map.cell(x, y).content.to_s
      end
      output << "\n"
    end 
    output
  end
end
