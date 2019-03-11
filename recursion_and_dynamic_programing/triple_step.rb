# 8.1 Triple Step
# a child running up a staircase with n steps can hop 2, 2 or 3 steps at a
# time. Implement a method to count how many possible ways the child can run
# up the stairs.


# brute force recursive solution
def count_ways(stairs)
  if stairs < 0
    return 0
  elsif (stairs == 0)
    return 1
  else
    return count_ways(stairs - 1) + count_ways(stairs - 2) + count_ways(stairs - 3)
  end
end

# improve this solution with memoization
