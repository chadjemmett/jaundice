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
    @visited = []
  end

  def solid?(player_x, player_y)
    @height.times do |y|
      @width.times do |x|
      return true if @lines[y][x] == "#" and (x == player_x/30 and y == player_y/30)
      end
    end
    false
  end

  def visited_tiles
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
          distance = Gosu.distance(x * 30, y * 30, @player.x, @player.y)
          if (30..60).include?(distance)
            @visited << {tile: 0, x: x * 30, y: y * 30 }
          elsif (60..120).include?(distance)
            @visited << {tile: 2, x: x * 30, y: y * 30}
          end
        end
      end
    end
  end

  def draw
    @visited.each do |tile_data|
      @tile[tile_data[:tile]].draw(tile_data[:x], tile_data[:y], 1)
    end
  end
end
