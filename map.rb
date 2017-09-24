class Map
  def initialize(window, player)
    @window = window
    @tile = Gosu::Image.load_tiles("media/map_tile.png", 30, 30)
    @tile_to_draw
    @lines = File.readlines("media/map1.txt").map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @text = Gosu::Font.new(15)
    @player = player
  end

  def solid?(player_x, player_y)
    @height.times do |y|
      @width.times do |x|
      return true if @lines[y][x] == "#" and (x == player_x/30 and y == player_y/30)
      end
    end
    false
  end

  def fog
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
           distance = Gosu.distance(x * 30, y * 30, @player.x, @player.y)
           if (30..60).include?(distance)
             @tile[0].draw(x * 30, y * 30, 1)
           elsif (60..90).include?(distance)
             @tile[2].draw(x * 30, y * 30, 1)
           end
           #@text.draw("#{x * 30}, #{y * 30}", x * 30, y * 30, 100)
        end
      end
    end
  end
end
