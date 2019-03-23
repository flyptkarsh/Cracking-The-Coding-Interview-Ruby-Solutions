# Remove duplicates from unsorted array
# Given an unsorted array of integers, Print the array after removing the
# duplicate elements from it. We need to print distinct array elements
# according to their first occurrence.

arr = [1, 2, 5, 1, 7, 2, 4, 2]
# ruby magic version
require 'set'
new_set = arr.to_set #<Set: {1, 2, 5, 7, 4}>
new_set.to_a # [1, 2, 5, 7, 4]

# hash map version
arr = [1, 2, 5, 1, 7, 2, 4, 2]
def remove_dups_hash_map(arr)
  counts = Hash.new(0)
  arr.each_with_index do |v, i|
    if counts[i] != true
      counts[i] = true
    else
      arr[i] = nil
    end
  end
  arr.compact
end
