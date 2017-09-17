class Hud
  def initialize(window)
    @window = window
    @width = @window.width
    @height = @window.height
# an image to be a frame.
#@frame = Gous::Image.new("media/frame.png")
  #@selector_dot = Gosu::Image.new("media/dot.png")
  end

  def update

  end

  def draw
    Gosu.draw_rect(0, @width, @width, -@height * 0.16, Gosu::Color::WHITE, 1)
    Gosu.draw_rect(10, @width - 10, @width - 20, -80, Gosu::Color::BLACK, 5)
    #@image.draw(lower, center, 1)
#@selector_dot.draw(draw when needed.)
  end



end
