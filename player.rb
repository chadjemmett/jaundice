class Actor
  attr_reader :x, :y
  def initialize(window, x, y, image_file, player=false)
    @window = window
    @x = x
    @y = y
    @image_tile = Gosu::Image.new(image_file)
    @player = player
    #@test_text = Gosu::Font.new(15)
  end

  def update
  end

  def draw
    @image_tile.draw(@x, @y, 100)
    #@test_text.draw("#{@x}, #{@y}", @x, @y - 20, 101)
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
