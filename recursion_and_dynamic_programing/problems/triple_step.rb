# frozen_string_literal: true

require 'benchmark'

# 8.1 Triple Step
# a child running up a staircase with n steps can hop 2, 2 or 3 steps at a
# time. Implement a method to count how many possible ways the child can run
# up the stairs.

# brute force recursive solution
# pg: 342
def triple_step_brute_force(stairs)
  if stairs.negative?
    0
  elsif stairs.zero?
    1
  else
    triple_step_brute_force(stairs - 1) + triple_step_brute_force(stairs - 2) + triple_step_brute_force(stairs - 3)
  end
end

puts('Test triple_step_brute_force:')
result = triple_step_brute_force(12)
puts(result == 927 ? '*' : "FAILING: triple_step_brute_force(12) returns #{result} instead of 927")
# this recusion occurs several times for the same step in the brute force solution.

# Improve this solution with memoization, pg: 343
def triple_step_memo(stairs)
  memo = Array.new(stairs + 1)
  triple_step(stairs, memo)
end

def triple_step(stairs, memo)
  if stairs.negative?
    0
  elsif stairs.zero?
    1
  elsif (memo[stairs]) && (memo[stairs] > -1)
    memo[stairs]
  else
    memo[stairs] = triple_step(stairs - 1, memo) + triple_step(stairs - 2, memo) + triple_step(stairs - 3, memo)
    memo[stairs]
  end
end

puts('Test triple_step memoized:')
result = triple_step_memo(12)
puts(result == 927 ? '*' : "FAILING: triple_step_memo(12) returns #{result} instead of 927")

puts 'Speed Test for Each Solution:'
n = 4
Benchmark.bm do |x|
  x.report { triple_step_brute_force(n) }
  x.report { triple_step_memo(n) }
end

puts 'Speed Test for Each Solution, large input:'
n = 20
Benchmark.bm do |x|
  x.report { triple_step_brute_force(n) }
  x.report { triple_step_memo(n) }
end
