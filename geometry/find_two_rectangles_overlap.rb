# Find if two rectangles overlap
# Source: https://www.geeksforgeeks.org/find-two-rectangles-overlap/

# Find if two rectangles overlap
# Given two rectangles, find if the given two rectangles overlap or not.
# Note that a rectangle can be represented by two coordinates, top left
# and bottom right. So mainly we are given following four coordinates.
# l1: Top Left coordinate of first rectangle.
# r1: Bottom Right coordinate of first rectangle.
# l2: Top Left coordinate of second rectangle.
# r2: Bottom Right coordinate of second rectangle.

# Two rectangles do not overlap if one of the following conditions is true.
# 1) One rectangle is above top edge of other rectangle.
# 2) One rectangle is on left side of left edge of other rectangle.
#
# We need to check above cases to find out if given rectangles overlap or not.
# Following is the implementation of the above approach.

class Point
  attr_accessor :x, :y
  def initialize(x,y)
      @x = x
      @y = y
  end
end

# Will return true or false based
def do_overlap?(l1, r1, l2, r2)
  return false if (l1.x >= r2.x) || (l2.x >= r1.x) # if one rectangle is to the side of the other
  return false if (l1.y <= r2.y) || (l2.y <= r1.y) # if one rectangle is above the other
  true
end

l1 = Point.new(0, 10)
r1 = Point.new(10, 0)
l2 = Point.new(5, 5)
r2 = Point.new(15, 0)

do_overlap?(l1, r1, l2, r2)
