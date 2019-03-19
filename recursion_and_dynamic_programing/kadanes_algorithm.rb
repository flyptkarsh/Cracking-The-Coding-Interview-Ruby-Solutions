# Dynamic Programming – Kadane’s Algorithm
# Find the maximum max contiguous sub array



# brute force
# check every combination
# too slow :(


def max_subarray(arr)
  max_so_far =  -1.0 /0 # this is negative INFINITY
  max_ending_here =  -1.0 /0 # this is negative INFINITY
  arr.each do |i|
    max_ending_here = [i, max_ending_here + i].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  max_so_far
end

arr = [1, -3, 2, 1, -1]
max_subarray(arr)
