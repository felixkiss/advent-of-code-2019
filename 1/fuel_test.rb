# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'fuel'

class FuelTest < Minitest::Test
  def test_fuel_for_mass_12
    assert_equal 2, Fuel.for(12)
  end

  def test_fuel_for_mass_14
    assert_equal 2, Fuel.for(14)
  end

  def test_fuel_for_mass_1969
    assert_equal 654, Fuel.for(1969)
  end

  def test_fuel_for_mass_100756
    assert_equal 33_583, Fuel.for(100_756)
  end

  def test_recursive_fuel_for_mass_14
    assert_equal 2, Fuel.recursive_for(14)
  end

  def test_recursive_fuel_for_mass_1969
    assert_equal 966, Fuel.recursive_for(1969)
  end

  def test_recursive_fuel_for_mass_100756
    assert_equal 50_346, Fuel.recursive_for(100_756)
  end
end
