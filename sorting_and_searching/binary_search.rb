# iterative binary search
def binary_search(arr, n)
  low = 0
  high = arr.length - 1
  while (low <= high) do
    mid = (low + high) / 2
    if arr[mid] < n
      low = mid + 1
    elsif arr[mid] > n
      high = mid - 1
    else
      return mid
    end
  end
  return -1
end

# recursive binary search
def recursive_binary_search(arr, n)
  mid = arr.size / 2
  return -1 if arr[mid].nil?
  if (arr[mid] < n )
    return recursive_binary_search(arr[mid ... -1], n)
  elsif (arr[mid] > n)
    return recursive_binary_search(arr[0 ... mid], n)
  else
    return mid
  end
end

# another recursive binary search algorithm
def recursive_binary_search_two(arr, value)
  low, hi = get_limits(arr)
  if low >= hi
    return false
  end
  mid = (low + hi)/ 2
  if arr[mid] == value
    return true
  elsif arr[mid] < value
    recursive_binary_search_two(arr[mid+1..hi], value)
  else
    recursive_binary_search_two(arr[low..mid], value)
  end
end

def get_limits(arr)
  [0, arr.length - 1]
end


test_arr = [1,2,3,4,5,6,7,8,10,11,12]

p recursive_binary_search_two(test_arr, 9)
p recursive_binary_search_two(test_arr, 8)
p binary_search(test_arr, 9)
p binary_search(test_arr, 8)
p recursive_binary_search(test_arr_two, 9)
p recursive_binary_search(test_arr_two, 8)
