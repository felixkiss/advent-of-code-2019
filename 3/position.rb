# frozen_string_literal: true

class Position
  attr_accessor :point, :steps_required

  def initialize(point, steps_required)
    @point = point
    @steps_required = steps_required
  end

  def ==(other)
    point == other.point
  end
  alias eql? ==

  def hash
    point.hash
  end

  def self.zero
    new(Point.zero, 0)
  end
end
