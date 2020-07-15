class Ship
  attr_reader :name, :length, :sunk, :health

  def initialize(name, length)
    @name = name
    @length = length
    @sunk = false
    @health = length
  end

  def sunk?
    if @health > 0
      @sunk
    else
      @sunk = true
    end
  end

  def hit
    @length -= 1
    @health -= 1
  end
end
