class Player
  def initialize(window, x, y, map)
    @window = window
    @x = x
    @y = y
    @map = map
    @player_image = Gosu::Image.new("media/player_sprite.png")
  end

  def update

  end

  def draw
    @player_image.draw_rot(@x, @y, 0, 0, 1)
  end

  def move(direction)
    case direction
      when :up
        @y -= 30 #unless @y == TOP
      when :down
        @y += 30 #unless @y == BOTTOM
      when :left
        @x -= 30 #unless @x == LEFT
      when :right
        @x += 30 #unless @x == RIGHT
    end
  end

  def clear?(direction)
#for testing
    true
=begin
    clear = true
    @map.each do |tile|
      case direction
        when :up
          if @x/30 == tile.x/30 and (@y - 30)/30 == tile.y/30
            clear = false
            end
        when :down
          if @x/30 == tile.x/30 and (@y + 30)/30 == tile.y/30
            clear = false
            end
        when :left
          if (@x - 30)/30 == tile.x/30 and @y/30 == tile.y/30
            clear = false
            end
        when :right
          if (@x + 30)/30 == tile.x/30 and @y/30 == tile.y/30
            clear = false
          end
      end
    end
    return clear
=end
  end
end
