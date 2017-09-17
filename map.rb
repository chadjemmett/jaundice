class Map
  attr_reader :x, :y
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
    @temp_number = Gosu::Font.new(50)
  end

  def draw
   @temp_number.draw("1", 200, 200, 1) 
  end
end
