class Map
  def initialize(window, file,  player, exxit)
    @window = window
    @lines = File.readlines(file).map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @text = Gosu::Font.new(15)
    @player = player
    @tiles = []
    create_tiles
  end

  def create_tiles
    @height.times do |y|
      @width.times do |x|
        tile = @lines
        case @lines[y][x]
          when "#"
            @tiles << Tiles.new(x * 30, y * 30, :basic)
          when "K"
            @tiles << Tiles.new(x * 30, y * 30, :key)
          when "E"
            @tiles << Tiles.new(x * 30, y * 30, :exit)
         end
      end
    end
  end

  def solid?(player_x, player_y)
    @height.times do |y|
      @width.times do |x|
      return true if @lines[y][x] == "#" and (x == player_x/30 and y == player_y/30)
      end
    end
    false
  end

  def update
    @tiles.each {|t| t.distance_from_player(@player.x, @player.y)}
  end

  def player_at_exit?
    [@player.x, @player.y] == [@exit[:x], @exit[:y]]
  end

  def draw
    @tiles.each {|tile| tile.draw}
  end
end
