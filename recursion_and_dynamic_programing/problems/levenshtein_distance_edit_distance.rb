# frozen_string_literal: true

# Edit Distance | DP-5
# Given two strings str1 and str2 and below operations that can performed on str1.
# Find minimum number of edits (operations) required to convert ‘str1’ into ‘str2’.

# Insert
# Remove
# Replace
# All of the above operations are of equal cost.

# Input:   str1 = "geek", str2 = "gesek"
# Output:  1
# We can convert str1 into str2 by inserting a 's'.
#
# Input:   str1 = "cat", str2 = "cut"
# Output:  1
# We can convert str1 into str2 by replacing 'a' with 'u'.
#
# Input:   str1 = "sunday", str2 = "saturday"
# Output:  3
# Last three and first characters are same.  We basically
# need to convert "un" to "atur".  This can be done using
# below three operations.
# Replace 'n' with 'r', insert t, insert a

# A Naive recursive Ruby program to fin minimum number
# operations to convert str1 to str2
# What are the subproblems in this case?
# The idea is process all characters one by one staring from either from left or right sides of both strings.
# Let us traverse from right corner, there are two possibilities for every pair of character being traversed.
# If last characters of two strings are same, nothing much to do. Ignore last characters and get count for remaining strings. So we recur for lengths m-1 and n-1.
#   Else (If last characters are not same), we consider all operations on ‘str1’, consider all three operations on last character of first string, recursively compute minimum cost for all three operations and take minimum of three values.
#   Insert: Recur for m and n-1
#   Remove: Recur for m-1 and n
#   Replace: Recur for m-1 and n-1

def edit_distance(str1, str2, m, n)
  # If first string is empty, the only option is to
  # insert all characters of second string into first
  return m if m.zero?
  return n if n.zero?
  # If last characters of two strings are same, nothing
  # much to do. Ignore last characters and get count for
  # remaining strings.
  return edit_distance(str1, str2, m - 1, n - 1) if str1[m - 1] == str2[n - 1]

  # If last characters are not same, consider all three
  # operations on last character of first string, recursively
  # compute minimum cost for all three operations and take
  # minimum of three values.
  1 + [edit_distance(str1, str2, m, n - 1), # Insert
       edit_distance(str1, str2, m - 1, n), # Remove
       edit_distance(str1, str2, m - 1, n - 1) # Replace
].min
end

str1 = 'sunday'
str2 = 'saturday'
print editDistance(str1, str2, len(str1), len(str2))

# Same problem with memoization and dynamic programming
# helper method recursion
def dp_edit_distance(str1, str2)
  @dp = [] # use a 2d array to memoize intermediate results
  str1.length.times do
    @dp.push(Array.new(str2.length))
  end

  def edit_distance(str1, str2, m, n)
    # If first string is empty, the only option is to
    # insert all characters of second string into first
    return @dp[m][n] if @dp[m][n]
    return m if m.zero?
    return n if n.zero?
    # If last characters of two strings are same, nothing
    # much to do. Ignore last characters and get count for
    # remaining strings.
    return edit_distance(str1, str2, m - 1, n - 1) if str1[m - 1] == str2[n - 1]

    # If last characters are not same, consider all three
    # operations on last character of first string, recursively
    # compute minimum cost for all three operations and take
    # minimum of three values.
    ed = 1 + [edit_distance(str1, str2, m, n - 1), # Insert
              edit_distance(str1, str2, m - 1, n), # Remove
              edit_distance(str1, str2, m - 1, n - 1)    # Replace
].min
    @db[m][n] = ed
    ed
  end
  edit_distance(str1, str2, str1.length, str2.length)
end

str1 = 'sunday'
str2 = 'saturday'
print editDistance(str1, str2, len(str1), len(str2))
