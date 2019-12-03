# frozen_string_literal: true

require 'rake/testtask'
require 'pry'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['**/*_test.rb']
end

task default: :test

task :day1 do
  require_relative '1/fuel'

  input = File.read('1/input').lines.map(&:to_i)
  fuel_sum = input.map { |i| Fuel.for(i) }.sum
  puts "Fuel sum: #{fuel_sum}"

  recursive_fuel_sum = input.map { |i| Fuel.recursive_for(i) }.sum
  puts "Recursive fuel sum: #{recursive_fuel_sum}"
end

task :day2 do
  require_relative '2/computer'

  # Once you have a working computer, the first step is to restore the gravity
  # assist program (your puzzle input) to the "1202 program alarm" state it had
  # just before the last computer caught fire. To do this, before running the
  # program, replace position 1 with the value 12 and replace position 2 with
  # the value 2. What value is left at position 0 after the program halts?
  replace_addresses = proc { |program, values|
    memory = program.split(',')

    values.each do |k, v|
      memory[k.to_i] = v
    end

    memory.join(',')
  }

  program = File.read('2/program')
  program_restored = replace_addresses.call(program, 1 => 12, 2 => 2)
  puts "1) #{Computer.run(program_restored)}"

  # To complete the gravity assist, you need to determine what pair of inputs
  # produces the output 19690720.
  #
  # The inputs should still be provided to the program by replacing the values
  # at addresses 1 and 2, just like before. In this program, the value placed in
  # address 1 is called the noun, and the value placed in address 2 is called
  # the verb. Each of the two input values will be between 0 and 99, inclusive.
  #
  # Once the program has halted, its output is available at address 0, also just
  # like before. Each time you try a pair of inputs, make sure you first reset
  # the computer's memory to the values in the program (your puzzle input) - in
  # other words, don't reuse memory from a previous attempt.
  #
  # Find the input noun and verb that cause the program to produce the output
  # 19690720. What is 100 * noun + verb?
  # (For example, if noun=12 and verb=2, the answer would be 1202.)


  (0..99).to_a.product((0..99).to_a).each do |pair|
    noun, verb = pair

    program_for_iteration = replace_addresses.call(program, 1 => noun, 2 => verb)

    output = Computer.run(program_for_iteration)
    result = output.split(',').first

    if result == '19690720'
    puts "2) Found input values: noun=#{noun} and verb=#{verb}" if result == '19690720'
    end
  end
end

task :day3 do
  require_relative '3/wire'
  wire1, wire2 = File.read('3/input').lines.map { |wire| Wire.from_string(wire) }

  # What is the Manhattan distance from the central port to the closest intersection?

  wire1, wire2 = File.read('3/wires.txt').lines.map { |wire| Wire.from_string(wire) }
  closest_distance = wire1.intersection_points(wire2).map(&:manhattan_distance).min
  puts "1) Manhattan distance: #{closest_distance}"

  # What is the fewest combined steps the wires must take to reach an intersection?
  fewest_steps = wire1.intersection_positions(wire2).map(&:steps_required).min
  puts "2) Fewest steps to intersection: #{fewest_steps}"
end
