# 8.9 Parens:
# Print all combinations of balanced parentheses

#
# Algorithm:
#
# Create a recursive function that accepts a string (s), count of opening brackets (o) and count of closing brackets (c) and the value of n.
# if the value of opening bracket and closing bracket is equal to n then print the string and return.
# If the count of opening bracket is greater than count of closing bracket then call the function recursively with the following parameters String s + “}”, count of opening bracket o, count of closing bracket c + 1, and n.
# If the count of opening bracket is less than n then call the function recursively with the following parameters String s + “{“, count of opening bracket o + 1, count of closing bracket c, and n.

def print_parens(str, n)
  print_parens_rec(str, 0, n, 0, 0) if n > 0
end

def print_parens_rec(str, pos, n, open, close)
  if close == n # base case
    return str
  else
    if open > close
      str[pos] = '}'
      print_parens_rec(str, pos + 1, n, open, close + 1)
    end
    if open < n
      str[pos] = '{'
      print_parens_rec(str, pos + 1, n, open + 1, close)
    end
  end
end

n = 3
str = [""] * 2 * n
print_parens(str, n)
