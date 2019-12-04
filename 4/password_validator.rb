# frozen_string_literal: true

class PasswordValidator
  def self.valid?(password)
    # Rules:

    #  - It is a six-digit number.
    return false unless password =~ /\A\d{6}\Z/

    #  - Two adjacent digits are the same (like 22 in 122345).
    return false unless password.chars.uniq.size < password.chars.size

    #  - Going from left to right, the digits never decrease; they only ever
    #    increase or stay the same (like 111123 or 135679).
    return false unless password.chars.sort == password.chars

    #  - two adjacent matching digits are not part of a larger group of matching
    #    digits (i.e. at least one digit has to repeat exactly twice).
    return false unless password.chars.group_by(&:to_s).any? { |_, occurrences| occurrences.size == 2 }

    true
  end
end
