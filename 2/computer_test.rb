# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'computer'

class ComputerTest < Minitest::Test
  def test_program_addition_and_multiplication
    assert_equal '3500,9,10,70,2,3,11,0,99,30,40,50', Computer.run('1,9,10,3,2,3,11,0,99,30,40,50')
  end

  def test_program_addition
    assert_equal '2,0,0,0,99', Computer.run('1,0,0,0,99')
  end

  def test_program_multiplication
    assert_equal '2,3,0,6,99', Computer.run('2,3,0,3,99')
  end

  def test_program_multiplication_2
    assert_equal '2,4,4,5,99,9801', Computer.run('2,4,4,5,99,0')
  end

  def test_program_altering_code
    assert_equal '30,1,1,4,2,5,6,0,99', Computer.run('1,1,1,4,99,5,6,0,99')
  end
end
