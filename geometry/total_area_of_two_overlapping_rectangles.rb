# Total area of two overlapping rectangles
# Given two overlapping rectangles on a plane.
# We are given bottom left and top right points of the two rectangles.
# We need to find the total area.

# Input : Point l1 = {2, 2}, r1 = {5, 7};
#         Point l2 = {3, 4}, r2 = {6, 9};
# Output : Total Area = 24
#
# Input :Point l1 = {2, 1}, r1 = {5, 5};
#        Point l2 = {3, 2}, r2 = {5, 7};
# Output : Total Area = 16
class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

def total_area(l1, r1, l2, r2)
  # find overlap
  overlap = find_overlap(l1, r1, l2, r2)
  # sum total area of each
  area1 = (l1.x - r1.x).abs * (l1.y - r1.y).abs
  area2 = (l2.x - r2.x).abs * (l2.y - r2.y).abs
  # subtract overlap
  area1 + area2 - overlap
end

def find_overlap(l1, r1, l2, r2)
  length = [r1.x, r2.x].min - [l1.x, l2.x].max
  height = [r1.y, r2.y].min - [l1.y, l2.y].max
  length * height
end

l1 = Point.new(2, 1)
r1 = Point.new(5, 5)
l2 = Point.new(3, 2)
r2 = Point.new(5, 7)
