# frozen_string_literal: true

# 0/1 Knapsack with Recursion
# Not in CTCI but a
# Reference: https://www.techiedelight.com/0-1-knapsack-problem/

# with recursion:
def knapsack(values, weights, item_left, capacity)
  # base case negative capacity
  return 0 if capacity.negative?

  # base case no items_left or capacity becomes 0
  return 0 if item_left.negative? || capacity.zero?

  # case 1: include current item_left in the knapsack values[item_left] and
  # recurse for the remaining items with a decreased capacity
  include_item = values[item_left] + knapsack(values, weights, item_left - 1, capacity - weights[item_left])
  # case 2: exclude current item_left from the knapsack and recurse for the
  # remaining items
  exclude_item = knapsack(values, weights, item_left - 1, capacity)

  # return the maximum value we get by including or excluding an item
  p "include: #{include_item}"
  p "exclude: #{exclude_item}"
  [include_item, exclude_item].max
end

values  = [20, 5, 10, 40, 15, 25]
weights = [1, 2, 3, 8, 7, 4]
capacity = 10
items_left = values.length - 1
p knapsack(values, weights, items_left, capacity)
