require 'gosu'
require_relative 'hud_window'
require_relative 'player'
require_relative 'map'
require_relative 'enemies'
require_relative 'messages'

class Jaundice < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Jaundice"
    @hud = Hud.new self
    @player = Actor.new(self, 90, 90, "media/player_sprite.png", true)
    @monster = Actor.new(self, 1110, 300, "media/player_sprite.png", false)
    @map = Map.new(self, "media/map2.txt", @player)
    @camera_x = 0
    @camera_y = 0
    @window = self
    @text = Gosu::Font.new(20)
    @message = Messages.new(self, 60, 590)
  end

  def update
    close if button_down?(Gosu::KbEscape)
    camera_change
    @map.visited_tiles
    @message.scroll
  end

  def draw
    Gosu::translate(-@camera_x, -@camera_y) do
      @player.draw
      @map.draw
      @monster.draw
    end
      @hud.draw
      @message.draw
  end

  def camera_change
    @camera_x = @player.x / 600 * 600
    @camera_y = @player.y / 480 * 480
  end

  def new_floor
   if @map.player_at_exit?
     @map = Map.new(self, "media/map2.txt", @player)
     end
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
         new_floor
    end
  end
end
window = Jaundice.new
window.show
