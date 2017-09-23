class Player
  attr_reader :x, :y
  def initialize(window, x, y, map)
    @window = window
    @x = x
    @y = y
    @map = map
    @player_image = Gosu::Image.new("media/player_sprite.png")
    @test_text = Gosu::Font.new(15)
  end



  def draw
    @player_image.draw(@x, @y, 100)
    @test_text.draw("#{direction_leaving_screen}", 90, 30, 101)
    @test_text.draw("#{@x}, #{@y}", @x, @y - 20, 101)
  end

  def direction_leaving_screen
    if @y <= -30
      return :top
    elsif @x <= -30
      return :left
    elsif @x >= @window.width
      return :right
    elsif @y >= 480
       return :bottom
    end
  end

  def transport_to_spot(x, y)
    @x = x
    @y = y
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
end
