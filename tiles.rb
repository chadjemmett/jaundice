class Tiles
  attr_reader :exit, :key
  def initialize(x, y, type)
    @x = x
    @y = y
    @type = type
    @visible = false
    @hazy = false
    @tile = Gosu::Image.load_tiles("media/map_tile.png", 30, 30)
  end

  def distance_from_player(x, y)
    distance = Gosu.distance(@x, @y, x, y)
    if (30..60).include?(distance)
      @visible = true
      @hazy = false
    end
    if (60..120).include?(distance)
      @visible = false
      @hazy = true
    else
      @hazy = false
      @visible = false
    end
  end

  def draw
    if @visible
      case @type
        when :basic
          @tile[0].draw(@x, @y, 1)
        when :key
          @tile[1].draw(@x, @y, 1)
        when :exit
          @tile[2].draw(@x, @y, 1)
      end
    elsif @hazy
      case @type
        when :basic
          @tile[0].draw(@x, @y, 1)
        when :key
          @tile[1].draw(@x, @y, 1)
        when :exit
          @tile[2].draw(@x, @y, 1)
      end
    end
  end

  def player_at_exit?(x, y)
    if @type == :exit and [x, y] == [@x, @y]
      return true
    end
  end
end
