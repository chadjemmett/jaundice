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
    @player = Player.new(self, 30, 30, @map)
    @enemies = [Enemies.new]
    @map = Map.new(self, @player)
  end

  def update
    close if button_down?(Gosu::KbEscape)
    @map.update
  end

  def draw
    @player.draw
    @hud.draw
    @map.draw
  end

  def button_down(id)
    case id
       when Gosu::KbUp
         @player.up unless @map.solid?(@player.x, @player.y - 30)
       when Gosu::KbDown
         @player.down unless @map.solid?(@player.x, @player.y + 30)
       when Gosu::KbLeft
         @player.left unless @map.solid?(@player.x - 30, @player.y)
       when Gosu::KbRight
         @player.right unless @map.solid?(@player.x + 30, @player.y)
       when Gosu::GP_UP
       when Gosu::GP_DOWN
       when Gosu::GP_LEFT
       when Gosu::GP_RIGHT
       when Gosu::GP_BUTTON_1
    end
  end
end
window = Jaundice.new
window.show
