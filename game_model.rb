require 'gosu'

class Model < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Game Model"
    @health = 30
    @meld = 15
    @tick = 0
    @time_til_transplant = 5 #rand(50) + 1
    @text = Gosu::Font.new(20)
    @red_box = Boxes.new(self, 200, 200, Gosu::Color::RED)
    @green_box = Boxes.new(self, 275, 200, Gosu::Color::GREEN)
    @player_box = Boxes.new(self, 400, 50, Gosu::Color.rgba(200, 200, 0, 255))
    @status = :playing
  end

  def update
    close if button_down?(Gosu::KbEscape)
    state
    health_status
  end

  def draw
    @text.draw("Health: #{@health}", 30, 20, 1)
    @text.draw("MELD: #{@meld}", 30, 45, 1)
    @text.draw("Tick: #{@tick}", 30, 70, 1)
    @text.draw("Time til transplant: #{@time_til_transplant}", 30, 95, 1)
    @text.draw("Status: #{@status}", 275, 95, 1)
    @text.draw("Increase your MELD score. But don't let your health go to low.", 5, 495, 1)
    @red_box.draw
    @green_box.draw
    @player_box.draw
  end

  def state
    case @state
      when :playing
        @status = "Waiting for Transplant"
      when :dead
        @status = "You are dead"
      when :super_sick
        @status = "You need a transplant soon"
      when :transplant
        @status = "You get a transplant!"
    end
  end

  def health_status
    if @meld == 40
      @state = :dead
    elsif @health == 0
      @state = :dead
    elsif @meld.between?(35, 40)
      @state = :super_sick
    elsif @tick == @time_til_transplant and @status == :playing and @health >= 15 and @meld >= 30
      @state = :transplant
    end
  end

  def button_down(id)
   if id == Gosu::MS_LEFT and @red_box.mouse_over_box?
     @meld += 1
     @health -= 1
     @tick += 1
   end
   if id == Gosu::MS_LEFT and @green_box.mouse_over_box?
     @meld -= 1
     @tick += 1
     @health += 1
   end
  end

  def needs_cursor?
    true
  end
end

class Boxes
  def initialize(window, x, y, color)
    @window = window
    @x = x
    @y = y
    @color = color
    @red = 200
    @green = 200
  end

  def draw
    Gosu.draw_rect(@x, @y, 50, 50, @color, 1)
  end

  def mouse_over_box?
    @window.mouse_x.between?(@x, @x + 50) and @window.mouse_y.between?(@y, @y + 50)
  end
end

window = Model.new
window.show
