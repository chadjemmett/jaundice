class Map
  attr_reader :x, :y
  def initialize(window)
    @window = window
    @temp_number = Gosu::Font.new(30)
    @x = 10
    @width = 200
    @height = 200
  end

  def draw
    10.times do |y|
        @temp_number.draw("#", x, y * 30, 1)
        @temp_number.draw("#", x + @width, y * 30, 1)
      10.times do |x|
        @temp_number.draw("#", x * 30, y, 1)
        @temp_number.draw("#", x * 30, y + @height, 1)
      end
    end
  end
end
