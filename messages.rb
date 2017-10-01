class Messages
  def initialize(window, x, y)
    @x = x
    @y = y
    @window = window
    @text = Gosu::Font.new(25)
    @message = "hello world"
    @test_message = Gosu::Font.new(15)
    @visible = true
  end

  def draw
   @text.draw(@message, @x, @y, 20) if @visible
  end

  def scroll
    if @y >= 480
      @y -= 3
      @visible = true
    else
      @y -= 0
      @visible = false
      end
  end

  def make_visible
  end
end
