class Player
  attr_reader :x, :y
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
    @player_image.draw(@x, @y, 100)
  end

  def up
    @y -= 30
  end

  def down
    @y += 30
  end

  def left
    @x -= 30
  end

  def right
    @x += 30
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

  def clear?(x, y)
   true if  @x/30 == x/30 and @y/30 == y/30
  end

end
