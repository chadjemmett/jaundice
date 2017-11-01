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
    if (30..90).include?(distance)
      @visible = true
      @hazy = false
    end
    if (90..150).include?(distance)
      @hazy = true
    end
  end

  def draw
    @tile[0].draw(@x, @y, 1) if @visible
    @tile[2].draw(@x, @y, 1) if @hazy
    @tile[1].draw(@x, @y, 1) if @type == :exit and @visible
    @tile[5].draw(@x, @y, 1) if @type == :exit and @hazy
    @tile[3].draw(@x, @y, 1) if @type == :key and @visible
    @tile[4].draw(@x, @y, 9) if @type == :key and @hazy
  end

  def player_at_exit?(x, y)
    if @type == :exit and [x, y] == [@x, @y]
      return true
    end
  end
end
