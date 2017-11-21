require 'gosu'
require_relative 'hud_window'
require_relative 'player'
require_relative 'map'
require_relative 'enemies'
require_relative 'messages'
require_relative 'tiles'

class Jaundice < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Jaundice"
    @hud = Hud.new self
    @player = Actor.new(self, 90, 90, "media/player_sprite.png", true, true)
    @monster = Actor.new(self, 540, 90, "media/player_sprite.png", false)
    @monster2 = Actor.new(self, 270, 30, "media/player_sprite.png", false)
    @queue = [@player, @monster, @monster2]
    @map = Map.new(self, "media/map2.txt", @player, {tile: 1, x: 180, y: 360})
    @camera_x = 0
    @camera_y = 0
    @window = self
    @text = Gosu::Font.new(20)
    @message = Messages.new(self, 60, 590)
  end

  def update
    close if button_down?(Gosu::KbEscape)
    camera_change
    if @queue[0].player == false and @queue[0].turn
      @queue[0].auto_move
      @queue[0].switch_turn
      @queue.rotate!
      @queue[0].switch_turn
    end
    @map.update
    @message.scroll
  end

  def draw
    Gosu::translate(-@camera_x, -@camera_y) do
      @player.draw
      @map.draw
      @monster.draw
      @monster2.draw
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
      if @player.turn and @queue[0] == @player
        case id
           when Gosu::KbUp
             @player.up unless @map.solid?(@player.x, @player.y - 30)
             @player.switch_turn
             @queue.rotate!
             @queue[0].switch_turn
           when Gosu::KbDown
             @player.down unless @map.solid?(@player.x, @player.y + 30)
             @player.switch_turn
             @queue.rotate!
             @queue[0].switch_turn
           when Gosu::KbLeft
             @player.left unless @map.solid?(@player.x - 30, @player.y)
             @player.switch_turn
             @queue.rotate!
             @queue[0].switch_turn
           when Gosu::KbRight
             @player.right unless @map.solid?(@player.x + 30, @player.y)
             @player.switch_turn
             @queue.rotate!
             @queue[0].switch_turn
           when Gosu::KbN
             new_floor
        end
      end
  end
end
window = Jaundice.new
window.show
