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
    @player = Player.new(self, 810, 510)
    @map = Map.new(self, @player)
    @camera_x = 0
    @camera_y = 0
    @window = self
    @text = Gosu::Font.new(20)
  end

  def update
    close if button_down?(Gosu::KbEscape)
    camera_change
    @map.visited_tiles
  end

  def draw
    Gosu::translate(-@camera_x, -@camera_y) do
      @player.draw
      @map.draw
    end
      @hud.draw
  end

  def camera_change
    @camera_x = @player.x / 570 * 570
    @camera_y = @player.y / 480 * 480
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
#for testing
       when Gosu::KbN
    end
  end
end
window = Jaundice.new
window.show
