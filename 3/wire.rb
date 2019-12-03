# frozen_string_literal: true

require_relative 'point'
require_relative 'position'

class Wire
  def self.from_string(string)
    new(string.split(','))
  end

  def initialize(steps)
    @steps = steps
  end

  def intersection_points(other_wire)
    points & other_wire.points - [Point.zero]
  end

  def intersection_positions(other_wire)
    intersection_points(other_wire).map do |point|
      Position.new(point, steps_to(point) + other_wire.steps_to(point))
    end
  end

  protected

  # Returns all points this wire is touching
  def points
    [Point.zero].tap do |points|
      x = y = 0 # Start at central port

      @steps.each do |step|
        direction = step[0]
        number_of_steps = step[1..-1].to_i

        number_of_steps.times do
          case direction
          when 'U' then y += 1
          when 'D' then y -= 1
          when 'L' then x -= 1
          when 'R' then x += 1
          end

          points << Point.new(x, y)
        end
      end
    end
  end

  # Returns steps necessary to go to the given point
  def steps_to(point)
    points.index(point)
  end
end
