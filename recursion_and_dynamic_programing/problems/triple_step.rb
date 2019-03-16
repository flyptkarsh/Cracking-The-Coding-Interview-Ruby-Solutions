# 8.1 Triple Step
# a child running up a staircase with n steps can hop 2, 2 or 3 steps at a
# time. Implement a method to count how many possible ways the child can run
# up the stairs.


# brute force recursive solution
# def count_ways(stairs)
#   if stairs < 0
#     return 0
#   elsif (stairs == 0)
#     return 1
#   else
#     return count_ways(stairs - 1) + count_ways(stairs - 2) + count_ways(stairs - 3)
#   end
# end

# improve this solution with memoization
def count_ways_memo(n)
  memo = Array.new(n + 1)
  count_ways(n, memo)
end

def count_ways(n, memo)
  if n < 0
    return 0;
  elsif n == 0
    return 1
  elsif (memo[n]) && (memo[n] > -1)
    return memo[n]
  else
    memo[n] = count_ways(n - 1, memo) + count_ways(n - 2, memo) + count_ways(n - 3, memo)
    return memo[n]
  end
end

p count_ways_memo(10)
