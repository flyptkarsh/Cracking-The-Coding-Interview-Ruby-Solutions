# frozen_string_literal: true

# Ruby implementation of quicksort
def quicksort(arr, first, last)
  if first < last
    p_index = partition(arr, first, last)
    quicksort(arr, first, p_index - 1)
    quicksort(arr, p_index + 1, last)
  end
  arr
end

def partition(arr, first, last)
  pivot = arr[last]
  p_index = first

  i = first
  while i < last
    if (arr[i]) && (arr[i] <= pivot)
      temp = arr[i]
      arr[i] = arr[p_index]
      arr[p_index] = temp
      p_index += 1
    end
    i += 1
  end
  temp = arr[p_index]
  arr[p_index] = pivot
  arr[last] = temp
  p_index
end

arr = [443, 74, 133, 24, 11, 23, 44, 81, 1496]

p quicksort(arr, 0, arr.size - 1)
