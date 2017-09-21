class Map
  attr_reader :x, :y
  def initialize(window, player)
    @window = window
    @tile = Gosu::Font.new(30)
    @x = 10
    @lines = File.readlines("media/map.txt").map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @player = player
  end

  def update
    @height.times do |y|
      @width.times do |x|
      end
    end
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
          @tile.draw("#", x * 30, y * 30, 1)
        end
      end
    end
  end
end
