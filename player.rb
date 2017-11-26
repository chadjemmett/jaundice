class Actor
  attr_reader :x, :y, :turn, :player, :visible, :hazy
  def initialize(window, x, y, tiles, turn=false, player=false)
    @window = window
    @x = x
    @y = y
    @image_tile = tiles
    @player = player
    @turn = turn
    @test_text = Gosu::Font.new(15)
    @hazy = false
    @visible = false
    puts @image_tile.class
  end

  def update
  end

  def draw
    if @player == false and @visible
      @image_tile[8].draw(@x, @y, 100)
    end
    if @player == false and @hazy
      @image_tile[9].draw(@x, @y, 100)
    end

    if @player
      @image_tile[6].draw(@x, @y, 100)
    end
    @test_text.draw("#{@x}, #{@y}", @x, @y - 20, 101)
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

  def switch_turn
    if @turn
      @turn = false
    else
      @turn = true
    end
  end

  def auto_move
   left = 60
   right = 540
   going_right = true
   if going_right and @x >= left
     @x -= 30
     if @x == left
       going_right = false
       end
   end
   if going_right == false and @x <= right
     @x += 30
     if @x == right
       going_right = true
      end
     end
  end

  def distance_from_player(x, y)
    distance = Gosu.distance(@x, @y, x, y)
    if (30..90).include?(distance)
      @visible = true
      @hazy = false
    end

    if (90..150).include?(distance)
      @hazy = true
    end

    if distance > 150
      @hazy = false
      @visible = false
    end
  end

 


end
