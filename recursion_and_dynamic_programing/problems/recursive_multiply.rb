# 8.5 Recursive Multiply
# Write a recursive function to multiply two positive integers without using
# the * or / operator. You can use addtion and subtraction.

# simple recursive solution

def multiply_recusive(x, y)
  if y == 0
    return 0
  elsif y > 0
    return (x + multiply_recusive(x, y -1))
  end
end

# Solution 1
# Something with bit manipulation
