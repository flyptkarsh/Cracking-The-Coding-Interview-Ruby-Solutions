# Dynamic Programming – Kadane’s Algorithm
# Find the maximum max contiguous sub array

# brute force
# check every combination
# too slow :(


def max_subarray(arr)
  max_so_far =  -1.0 /0 # this is negative INFINITY
  max_ending_here =  -1.0 /0 # this is negative INFINITY
  arr.each do |i|
    max_ending_here = [i, max_ending_here + i].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  max_so_far
end

arr = [1, -3, 2, 1, -1]
max_subarray(arr)

# slightly different Kadane's Algorithm
def maximum_subarray_sum(array)
  max_ending_here, max_so_far = 0, 0
  array.each do |ele|
    max_ending_here = [0, max_ending_here + ele].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  max_so_far
end

# Best Time to Buy and Sell Stock
# dynamic programing and kadane's algorithm

# brute force
# check every combination
# too slow :(

def max_profit(prices)
  return 0 if prices.count < 2

  profit = 0
  min_price = prices[0]

  (1..prices.count-1).each do |k|
    # profit represents the max profit between day 0 and day k
    # min_price represents minimum prices from day 0 to day k - 1
    profit = prices[k] - min_price if profit < prices[k] - min_price
    min_price = prices[k] if prices[k] < min_price

  end
  profit
end
prices = [7,1,5,3,6,4]
p max_profit(prices)
