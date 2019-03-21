# 349. Intersection of Two Arrays
# Given two arrays, write a function to compute their intersection.
# https://leetcode.com/articles/intersection-of-two-arrays/

# Approach 1: Two Sets
# Intuition
# the normal non coding interview way
# array_one && array_two

 # The naive approach would be to iterate along the first array nums1 and to
 # check for each value if this value in nums2 or not. If yes - add the value
 # to output. Such an approach would result in a pretty bad
 # \mathcal{O}(n \times m)O(n×m) time complexity, where n and m are arrays' lengths.

# To solve the problem in linear time, let's use the structure set, which
# provides in/contains operation in \mathcal{O}(1)O(1) time in average case.

# The idea is to convert both arrays into sets, and then iterate over the
# smallest set checking the presence of each element in the larger set.
# Time complexity of this approach is \mathcal{O}(n + m)O(n+m) in the average case.
require 'set'

# syntax for converting an array into a set
[1,0,1,0,3,4,5].to_set # => #<Set: {1, 0, 3, 4, 5}>

def intersection_using_sets(arr_a, arr_b)
  set_a = arr_a.to_set
  set_b = arr_b.to_set
  larger_set  = set_a.size > set_b.size ?  set_a : set_b
  smaller_set = set_a.size > set_b.size ?  set_b : set_a
  intersection = []
  larger_set.each do |v|
    intersection.push(v) if smaller_set.include? v
  end
  intersection
end
