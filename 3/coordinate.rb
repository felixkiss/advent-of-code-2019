# frozen_string_literal: true

class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{x}/#{y}"
  end

  def manhattan_distance
    x.abs + y.abs
  end

  def ==(other)
    x == other.x && y == other.y
  end
  alias_method :eql?, :==

  def hash
    x.hash ^ y.hash
  end

  def self.zero
    new(0, 0)
  end
end
