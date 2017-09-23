class Map
  attr_reader :x, :y
  def initialize(window, player)
    @window = window
    @tile = Gosu::Image.new("media/map_tile.png")
    @lines = File.readlines("media/map1.txt").map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @rooms = [{file: "media/map.txt"}, 
    {file: "media/map1.txt"},
    {file: "media/map2.txt"},
    {file: "media/map3.txt"},
    
    ]
    @camera_x = 0
    @camera_y = 0
    @text = Gosu::Font.new(15)
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

  def new_room(player_exit)
    @rooms
    @lines = File.readlines("media/map1.txt").map {|line| line.chomp}
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        if @lines[y][x] == "#"
          @tile.draw(x * 30, y * 30, 1)
          #@text.draw("#{x * 30}, #{y * 30}", x * 30, y * 30, 100)
        end
      end
    end
  end
end
