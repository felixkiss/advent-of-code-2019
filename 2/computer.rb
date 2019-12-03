# frozen_string_literal: true

class Computer
  def self.run(program)
    new(program).run
  end

  def initialize(program)
    @instruction_pointer = 0
    @memory = program.split(',').map(&:to_i)
  end

  def run
    run_instruction until done?
    print_memory
  end

  private

  def run_instruction
    case @memory[@instruction_pointer]
    when 1 then add
    when 2 then multiply
    else        quit
    end

    @instruction_pointer += 4
  end

  def add
    self.result = parameters.reduce(:+)
  end

  def multiply
    self.result = parameters.reduce(:*)
  end

  def parameters
    @memory.slice(@instruction_pointer + 1, 2).map { |index| @memory[index] }
  end

  # set output of current command
  def result=(value)
    target_address = @memory[@instruction_pointer + 3]
    @memory[target_address] = value
  end

  def quit
    @instruction_pointer = @memory.length + 1
  end

  def done?
    @instruction_pointer > @memory.length
  end

  def print_memory
    @memory.join(',')
  end
end
