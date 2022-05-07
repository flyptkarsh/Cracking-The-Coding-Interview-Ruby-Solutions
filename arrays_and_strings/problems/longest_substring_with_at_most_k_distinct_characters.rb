# frozen_string_literal: true

# 340. Longest Substring with at Most K Distinct Characters
# Given a string, find the length of the longest substring T that contains at
# most k distinct characters.
# https://leetcode.com/articles/longest-substring-with-at-most-k-distinct-characte/
#
#
# Input: s = "eceba", k = 2
# Output: 3
# Explanation: T is "ece" which its length is 3.

# Input: s = "aa", k = 1
# Output: 2
# Explanation: T is "aa" which its length is 2.

# Approach 1: Sliding Window + Hashmap.

def with_k_distinct_chars(str, k)
  curr_longest = []
  arr = str.chars
  arr.each.with_index do |_v, i|
    arr[i..-1].each.with_index do |_v2, i2|
      char_map = count_chars(arr[i..i2])
      break if char_map.size > k

      curr_longest = arr[i..i2] if char_map.size <= k && arr[i..i2].size > curr_longest
    end
  end
end

def count_chars(arr)
  char_count = Hash.new(0)
  arr.chars.each do |c|
    char_count[c] += 1
  end
end

# Approach 2: Sliding Window + Ordered Dictionary.
