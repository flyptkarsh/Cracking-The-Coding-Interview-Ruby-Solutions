# frozen_string_literal: true

# 8.3 Magic Index
# A magic index in an array A[1...n -1] is defined to be an index such that A[i]= i
# Given a sorted array find the magic index.

# Slow Brute Force
def magic_slow(arr)
  arr.each_with_index do |val, index|
    return index if val === index
  end
end

array_with_magic_index = [0, 2, 3, 4, 5, 6, 7]
array_without_magic_index = [2, 3, 4, 5, 6, 7]
magic_slow(array_without_magic_index)
magic_slow(array_with_magic_index)

# Solution 1
# faster approach using binary search and recursion
def fast_magic(arr, start_index, end_index)
  return -1 if end_index < start_index

  mid = end_index + start_index / 2
  if arr[mid] == mid
    mid
  elsif arr[mid] > mid
    fast_magic(arr, start_index, mid - 1)
  else
    fast_magic(arr, mid + 1, end_index)
  end
end

fast_magic(array_without_magic_index, 0, array_without_magic_index.size - 1)
fast_magic(array_with_magic_index, 0, array_with_magic_index.size - 1)
