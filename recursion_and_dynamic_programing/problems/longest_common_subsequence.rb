# frozen_string_literal: true

# Longest Common Subsequence (Dynamic Programming)
# source: https://www.youtube.com/watch?v=Qf5R-uYQRPk

# recursive without memoization
def lcs(p, q, n, m)
  if n.zero? || m.zero? # base case
    result = 0
  elsif p[n - 1] == q[m - 1] # if the next chars are common
    result = 1 + lcs(p, q, n - 1, m - 1) # recurse over the next chars in each string
  else # if the next chars are not common
    tmp1 = lcs(p, q, n - 1, m)
    tmp2 = lcs(p, q, n, m - 1)
    result = [tmp1, tmp2].max
  end
  result
end

# bad beacuse of lots of duplicate computation

# recursive without memoization
# with helper method recursion
def memo_lcs(_p, _q, n, m)
  @memo = []
  n.times { @memo.push(Array.new(m)) }
  def lcs(p, q, n, m)
    return @memo[n][m] if @memo[n][m] # return memoized result if availible

    if n.zero? || m.zero? # base case
      result = 0
    elsif p[n - 1] == q[m - 1] # if the next chars are common
      result = 1 + lcs(p, q, n - 1, m - 1) # recurse over the next chars in each string
    else # if the next chars are not common
      tmp1 = lcs(p, q, n - 1, m)
      tmp2 = lcs(p, q, n, m - 1)
      result = [tmp1, tmp2].max
      @memo[n][m] = result # save memoized result
    end
    result
  end
end
