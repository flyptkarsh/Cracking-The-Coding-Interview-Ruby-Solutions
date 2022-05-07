# frozen_string_literal: true
require 'benchmark'
require 'faker'


# 1.4 Palindrome Permutation, pg: 196
# Check a string to see if it is a permutation of a palindrome?


example_input_true = 'tact coa' # expect true because "tacocat" is a palindrome
example_input_false = 'ehmmmmmmmm' # expect false no palindromes

# Solution 1: 
# a palendrome can only have one char with an odd count, 
# to solve count all chars and check for odd counts, only one char can have an odd count in a palendrome
def is_palendrome_permutation?(str)
  odd_count = count_chars(str).map { |_k, v| v }.select(&:odd?).size
  odd_count <= 1
end

def count_chars(str)
  char_counts = Hash.new(0)
  str.chars.each do |char|
    char_counts[char] += 1
  end
  char_counts
end

puts "Tests for Solution 1:"
puts( is_palendrome_permutation?(example_input_true) == true ? "PASSING: #{example_input_true} returns true " : "FAILING: #{example_input_true}  returns false")
puts( is_palendrome_permutation?(example_input_false) == false ? "PASSING: #{example_input_false} returns false " : "FAILING: #{example_input_false} returns true")

# Solution 2:
# Instead of checking at the end, check after counting each char. 
# This is more efficient than solution 1

def is_palendrome_permutation_optimized?(str)
  odd_counts = 0 
  str.chars.uniq.each do |char|
    odd_counts += 1 if str.count(char).odd?
    return false if odd_counts > 1
  end
  odd_counts > 1 ? false : true
end

puts "Tests for Solution 2:"
puts( is_palendrome_permutation_optimized?(example_input_true) == true ? "PASSING: #{example_input_true} returns true " : "FAILING: #{example_input_true}  returns false")
puts( is_palendrome_permutation_optimized?(example_input_false) == false ? "PASSING: #{example_input_false} returns false " : "FAILING: #{example_input_false} returns true")

# Solution 3:
# This is the most efficient solution. 
# nothing needs to be stored, in the book it says to use a bit vector.

def is_palendrome_permutation_most_optimized?(str)
  odd_encountered = false
  ("a".."z").to_a.each do |char|
    if str.count(char).odd?
      if odd_encountered
        return false 
      end 
      odd_encountered = true 
    end 
  end
  true
end

# NOTE: this solution may be faster for larger inputs but not for all small inputs

puts("Tests for Solution 3:")
puts( is_palendrome_permutation_most_optimized?(example_input_true) == true ? "PASSING: #{example_input_true} returns true " : "FAILING: #{example_input_true}  returns false")
puts( is_palendrome_permutation_most_optimized?(example_input_false) == false ? "PASSING: #{example_input_false} returns false " : "FAILING: #{example_input_false} returns true")


# Speed Test for Each Solution:
puts "Speed Test for Each Solution (small input):"
str = 'tact coa'
Benchmark.bm do |x|
  x.report { is_palendrome_permutation?(str) }
  x.report { is_palendrome_permutation_optimized?(str)}
  x.report { is_palendrome_permutation_most_optimized?(str) }
end

puts "Speed Test for Each Solution (larger input input):"
str = 'saippuakivikauppiassaippuakivikauppiassaippuakivikauppiassaippuakivikauppias'
Benchmark.bm do |x|
  x.report { is_palendrome_permutation?(str) }
  x.report { is_palendrome_permutation_optimized?(str)}
  x.report { is_palendrome_permutation_most_optimized?(str) }
end
