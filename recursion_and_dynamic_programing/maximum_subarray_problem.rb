# frozen_string_literal: true

# maximum subarray problem
# https://www.youtube.com/watch?v=86CQq3pKSUw
# find a subarray with the maximum sum

# brute force solution,
# check all possible solutions
# too long On^2 time

# optimal solution
# kadane's algorithm
# calculate the local maximum subbararry for the each index
# the maximum subarray at a given index is ether the itself
# of the combination of itself and the previous maximum

arr = [-2, 3, 2, -1]

def kadane(arr)
  max_curr = arr[0]
  global_max = arr[0]
  arr.each_index do |i|
    max_curr = [arr[i], max_curr + arr[i]].max
    global_max = max_curr if max_curr > global_max
  end
  global_max
end

# expect kadane(arr) to eq 5
