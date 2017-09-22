class Map
  attr_reader :x, :y
  def initialize(window, player)
    @window = window
    @tile = Gosu::Image.new("media/map_tile.png")
    @lines = File.readlines("media/map.txt").map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @rooms = []
  end

  def update
  end

  def solid?(player_x, player_y)
    @height.times do |y|
      @width.times do |x|
      return true if @lines[y][x] == "#" and (x == player_x/30 and y == player_y/30)
      end
    end
    false
  end

  def new_room
    @lines = File.readlines("media/map.txt").map {|line| line.chomp}
  end



  def draw
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
          @tile.draw(x * 30, y * 30, 1)
        end
      end
    end
  end
end
