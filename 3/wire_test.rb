# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'wire'
require 'pry'

class WireTest < Minitest::Test
  def test_intersection_points
    wire1 = Wire.from_string('R8,U5,L5,D3')
    wire2 = Wire.from_string('U7,R6,D4,L4')

    assert_equal [Point.new(6, 5), Point.new(3, 3)], wire1.intersection_points(wire2)
  end

  def test_manhattan_distance
    wire1 = Wire.from_string('R75,D30,R83,U83,L12,D49,R71,U7,L72')
    wire2 = Wire.from_string('U62,R66,U55,R34,D71,R55,D58,R83')
    assert_equal 159, wire1.intersection_points(wire2).map(&:manhattan_distance).min

    wire1 = Wire.from_string('R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51')
    wire2 = Wire.from_string('U98,R91,D20,R16,D67,R40,U7,R15,U6,R7')
    assert_equal 135, wire1.intersection_points(wire2).map(&:manhattan_distance).min
  end

  def test_best_steps
    wire1 = Wire.from_string('R75,D30,R83,U83,L12,D49,R71,U7,L72')
    wire2 = Wire.from_string('U62,R66,U55,R34,D71,R55,D58,R83')
    assert_equal 610, wire1.intersection_positions(wire2).map(&:steps_required).min

    wire1 = Wire.from_string('R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51')
    wire2 = Wire.from_string('U98,R91,D20,R16,D67,R40,U7,R15,U6,R7')
    assert_equal 410, wire1.intersection_positions(wire2).map(&:steps_required).min
  end
end
