# You are given two sorted arrays. a and b,
# where a has a large enough buffer at the end to hold b.
# write a method to merge a into b in a sorted order.
def sorted_merge( a, b )
  index_a = a.size - 1# index of last element in array a
  index_b = b.size - 1 # index of last element in array b
  index_merged = a.size + b.size - 1 # end of merged array
  merged_array = Array.new(index_merged)

  # merge a and b starting with the last element in each
  while (index_b >= 0) do
    if (index_a >= 0) && (a[index_a] > b[index_b])
      merged_array[index_merged] = a[index_a]
      index_a -= 1
    else
      merged_array[index_merged] = b[index_b]
      index_b  -= 1
    end
    index_merged -= 1
  end
  merged_array
end

test_a = [2,3,4,5,6,7]
test_b = [1,2,3,4,5,8,9,12]

sorted_merge( test_a, test_b )
