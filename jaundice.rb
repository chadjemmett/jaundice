require 'gosu'
require_relative 'hud_window'
require_relative 'player'
require_relative 'map'
require_relative 'enemies'

class Jaundice < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Jaundice"
    @hud = Hud.new self
    @map = Map.new(self)
    @player = Player.new(self, 30, 30, @map)
    @enemies = [Enemies.new]
  end

  def update
    close if button_down?(Gosu::KbEscape)
  end

  def draw
    @player.draw
    @hud.draw
    @map.draw
  end

  def button_down(id)
    case id
       when Gosu::KbUp
         if @player.clear?(:up)
           @player.move(:up)
         end
       when Gosu::KbDown
         if @player.clear?(:down)
           @player.move(:down)
         end
       when Gosu::KbLeft
         if @player.clear?(:left)
           @player.move(:left)
         end
       when Gosu::KbRight
         if @player.clear?(:right)
           @player.move(:right)
         end
       when Gosu::GP_UP
         if @player.clear?(:up)
           @player.move(:up)
         end
       when Gosu::GP_DOWN
         if @player.clear?(:down)
           @player.move(:down)
         end
       when Gosu::GP_LEFT
         if @player.clear?(:left)
           @player.move(:left)
         end
       when Gosu::GP_RIGHT
         if @player.clear?(:right)
           @player.move(:right)
         end
       when Gosu::GP_BUTTON_1
         @bombs << Bomb.new(@player.x, @player.y)
    end
  end
end
window = Jaundice.new
window.show
