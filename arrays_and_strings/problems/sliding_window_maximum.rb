# frozen_string_literal: true

# 239. Sliding Window Maximum

# Given an array nums, there is a sliding window of size k which is moving from
# the very left of the array to the very right. You can only see the k numbers
# in the window. Each time the sliding window moves right by one position.
# Return the max sliding window.
#
# Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
# Output: [3,3,5,5,6,7]
# Explanation:
#
# Window position                Max
# ---------------               -----
# [1  3  -1] -3  5  3  6  7       3
#  1 [3  -1  -3] 5  3  6  7       3
#  1  3 [-1  -3  5] 3  6  7       5
#  1  3  -1 [-3  5  3] 6  7       5
#  1  3  -1  -3 [5  3  6] 7       6
#  1  3  -1  -3  5 [3  6  7]      7

def max_sliding_window(nums, k)
  return [] if nums.empty?

  deque = [] # Will store indices
  maxes = []

  nums.each_with_index do |num, i|
    # Remove indices of elements not in the current window
    deque.shift while deque.any? && deque[0] < i - k + 1

    # Remove indices of all elements smaller than
    # the current element from the back of the deque
    deque.pop while deque.any? && nums[deque[-1]] <= num

    # Add current element's index to the deque
    deque << i

    # Add current max to maxes array once we've processed the first k elements
    maxes << nums[deque[0]] if i >= k - 1
  end

  maxes
end

# Example usage
nums = [1, 3, -1, -3, 5, 3, 6, 7]
k = 3
puts max_sliding_window(nums, k)
