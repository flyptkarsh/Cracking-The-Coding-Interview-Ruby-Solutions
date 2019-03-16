# 10.5 Sparse Search
# Given a sorted array of strings that is interspersed with empty strings,
# write a method find the location of a given string.

example_input = ["", "a", "", "b", "", "", "c", "d", "", "e", "f"]


# Brute force
# downside slow, o(n)
def brute_force_sparse_search(arr, element)
  arr.each_with_index do |value, index|
    if value == element
      return index
    end
  end
  return -1
end

p brute_force_sparse_search(example_input, "c")
p brute_force_sparse_search(example_input, "x")
