class Messages
  def initialize(window, x, y)
    @x = x
    @y = y
    @window = window
    @text = Gosu::Font.new(25)
    @message = "hello world"
    @visible = false
  end

  def draw
   @text.draw(@message, @x, @y, 20) if @visible
  end

  def scroll
  end

  def make_visible
    if @visible
      @visible = false
      else
        @visible = true
      end
  end
end
