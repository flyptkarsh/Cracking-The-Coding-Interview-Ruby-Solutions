# frozen_string_literal: true

# https://www.youtube.com/watch?v=xOlhR_2QCXY
# Based on a CS DOJO video
# recursive Knapsack No DP..

def rec_ks(_weights, _values, capacity)
  @weights = w
  @vals = v

  def ks(pointer, capacity)
    if pointer.zero? || capacity.zero?
      result = 0
    elsif @weights[pointer] > capacity
      result = ks(pointer - 1, capacity)
    else
      tmp1 = ks(pointer - 1, capacity)
      tmp2 = @vals[pointer] + ks(pointer - 1, capacity - @weights[pointer])
      result = [tmp1, tmp2].max
    end
    result
  end

  ks(@vals.length + 1, capacity)
end

# add memoization
def rec_ks_with_memoization(_weights, _values, capacity)
  @weights = w
  @vals = v
  @memo = []
  def ks(pointer, capacity)
    return @memo[pointer][capacity] if @memo[pointer][capacity]

    if pointer.zero? || capacity.zero?
      result = 0
    elsif @weights[pointer] > capacity
      result = ks(pointer - 1, capacity)
    else
      tmp1 = ks(pointer - 1, capacity)
      tmp2 = @vals[pointer] + ks(pointer - 1, capacity - @weights[pointer])
      result = [tmp1, tmp2].max
      @memo[pointer][capacity] = result
    end
    result
  end
  ks(@vals.length + 1, capacity)
end
