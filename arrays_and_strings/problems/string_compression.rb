# frozen_string_literal: false

require 'benchmark'

# 1.6 String Compression, pg: 201

# Implement a method to perform basic string compression using the counts of repeated characters.

test_input = 'aabcccccaaa'
test_result = 'a2b1c5a3'
test_input_two = 'abcd'
test_result_two = 'abcd'

# Bad Brute force solution:
# just loop through the string and check if the next char is the same.

# from the book: pg 201
def brute_force_compress(str)
  compressed_str = ''
  count_consecutive = 0
  str.each_char.with_index do |char, index|
    count_consecutive += 1
    next_char_different = ((index + 1) == str.chars.size || (str.chars[index + 1] != char))
    if next_char_different
      compressed_str << (char << count_consecutive.to_s)
      count_consecutive = 0
    end
  end
  compressed_str.length < str.length ? compressed_str : str
end

# why this is bad:
# Sting concatenation is O(n^2), accoring to the book.
# although string concatention in Ruby is much more optimized than string concatenation in C.

puts('Brute force solution test:')
result = brute_force_compress(test_input)
puts(result == test_result ? '*' : "FAILING: #{test_input} returns #{result} instead of #{test_result}")
result = brute_force_compress(test_input_two)
puts(result == test_result_two ? '*' : "FAILING: #{test_input_two} returns #{result} instead of #{test_result_two}")

# Solution 1, pg 202:
# This is a slightly more efficient solution.
# this avoids turning a string into an array multiple times.
def compress_solution_one(str)
  compressed_str = ''
  count_consecutive = 0
  str_chars = str.chars
  str_size = str_chars.size
  str_chars.each.with_index do |char, index|
    count_consecutive += 1
    next_char_different = ((index + 1) == str_size || (str_chars[index + 1] != char))
    if next_char_different
      compressed_str << char
      compressed_str << count_consecutive.to_s
      count_consecutive = 0
    end
  end
  compressed_str.length < str_size ? compressed_str : str
end

puts('Solution 1 test:')
result = compress_solution_one(test_input)
puts(result == test_result ? '*' : "FAILING: #{test_input} returns #{result} instead of #{test_result}")
result = compress_solution_one(test_input_two)
puts(result == test_result_two ? '*' : "FAILING: #{test_input_two} returns #{result} instead of #{test_result_two}")

# Solution 2:
# this soulution is more efficient than solution 1 for larger inputs
# because it will check if it can compress to something shorter before starting before.

def compress_solution_two(str)
  str_chars = str.chars
  str_size = str_chars.size
  return str if str_size < compressed_size(str_chars, str_size)

  compressed_str = ''
  count_consecutive = 0
  str_chars.each.with_index do |char, index|
    count_consecutive += 1
    next_char_different = ((index + 1) == str_size || (str_chars[index + 1] != char))
    if next_char_different
      compressed_str << char
      compressed_str << count_consecutive.to_s
      count_consecutive = 0
    end
  end
  compressed_str
end

# pg 202 return the length of the compressed string
def compressed_size(str_chars, str_size)
  final_size = 0
  count_consecutive = 0
  str_chars.each_with_index do |char, index|
    count_consecutive += 1
    next_char_different = ((index + 1) == str_size || (str_chars[index + 1] != char))
    next unless next_char_different

    final_size += 1
    final_size += count_consecutive.to_s.size
    count_consecutive = 0
  end
  final_size # return the length of the compressed string
end

puts('Solution 2 test:')
result = compress_solution_two(test_input)
puts(result == test_result ? '*' : "FAILING: #{test_input} returns #{result} instead of #{test_result}")
result = compress_solution_two(test_input_two)
puts(result == test_result_two ? '*' : "FAILING: #{test_input_two} returns #{result} instead of #{test_result_two}")

# Speed Test for Each Solution:
puts "Speed Test for Each Solution: for input 'aabcccccaaa'"
str = 'aabcccccaaa'
Benchmark.bm do |x|
  x.report { brute_force_compress(str) }
  x.report { compress_solution_one(str) }
  x.report { compress_solution_two(str) }
end

puts 'Speed Test for Each Solution (larger input):'
str = 'aabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaa'
Benchmark.bm do |x|
  x.report { brute_force_compress(str) }
  x.report { compress_solution_one(str) }
  x.report { compress_solution_two(str) }
end

puts 'Speed Test for Each Solution (larger input):'
str = 'aabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaaaabcccccaaa'
Benchmark.bm do |x|
  x.report { brute_force_compress(str) }
  x.report { compress_solution_one(str) }
  x.report { compress_solution_two(str) }
end

puts 'Speed Test for Each Solution (worst case input):'
# this test highlights why solution 2 is the most efficient for some inputs
str = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
Benchmark.bm do |x|
  x.report { brute_force_compress(str) }
  x.report { compress_solution_one(str) }
  x.report { compress_solution_two(str) }
end
