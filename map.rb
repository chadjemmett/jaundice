class Map
  attr_reader :x, :y
  def initialize(window, player)
    @window = window
    @tile = Gosu::Image.new("media/map_tile.png")
    @x = 10
    @lines = File.readlines("media/map.txt").map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @player = player
    @text = Gosu::Font.new(25)
    @map_text = Gosu::Font.new(10)
    @clash = false
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



  def draw
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
          @tile.draw(x * 30, y * 30, 1)
          @map_text.draw("#{x * 30}, #{y * 30}", x * 30, y * 30 , 4)
        end
      end
    end
    #@text.draw(@clash.to_s, 550, 60, 4)
    @text.draw("X: #{@player.x}, Y: #{@player.y}", 350, 90, 4)
    @text.draw("#{self.solid?(@player.x, @player.y)}", 50, 90, 4)
  end
end
