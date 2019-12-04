# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'password_validator'
require 'pry'

class PasswordValidatorTest < Minitest::Test
  def test_valid_password_is_valid
    assert PasswordValidator.valid?('111111')
  end

  def test_password_with_decreasing_digit_is_invalid
    refute PasswordValidator.valid?('223450')
  end

  def test_password_without_adjacent_double_is_invalid
    refute PasswordValidator.valid?('123789')
  end

  def test_password_that_is_not_6_digits_is_invalid
    refute PasswordValidator.valid?('11111')
    refute PasswordValidator.valid?('1111111')
  end
end
