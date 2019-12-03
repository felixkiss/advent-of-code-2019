# frozen_string_literal: true

require_relative 'coordinate'

class Wire
  def self.from_string(string)
    new(string.split(','))
  end

  def initialize(steps)
    @steps = steps
  end

  def intersection_points(other_wire)
    coordinates & other_wire.coordinates - [Coordinate.zero]
  end

  protected

  # Returns all coordinates this wire is touching
  def coordinates
    [Coordinate.zero].tap do |coordinates|
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

          coordinates << Coordinate.new(x, y)
        end
      end
    end
  end
end
