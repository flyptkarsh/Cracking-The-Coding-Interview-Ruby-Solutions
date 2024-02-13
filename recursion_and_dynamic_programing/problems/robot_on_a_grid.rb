# frozen_string_literal: true

require 'benchmark'

# 8.2 Robot on a Grid
# pg: 344
# Write a program that accepts a grid and returns the number of ways the robot can move from the top left corner to the bottom right corner.
# There are certian tiles that are impassible, such as walls and obstacles.
# The robot can only move up, down, left, or right.
#   Example:
#   1's are impassible walls
#   maze = [
#       [0, 1, 0, 0],
#       [0, 0, 0, 1],
#       [0, 1, 0, 0],
#       [0, 0, 0, 0]
#   ]
test_maze = [
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
]
impassable_maze = [
  [0, 1, 0, 0],
  [1, 1, 1, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
]

# Helper method recursion and memoization solution

class Point
  attr_accessor :row, :col, :key

  def initialize(row, col)
    @row = row
    @col = col
    @key = [row, col].compact.join('_')
  end
end

# return path or false if no path
def traverse_maze(maze)
  def get_path(maze, row, col, current_path)
    return false if row.negative? || row >= maze.length || col.negative? || col >= maze[0].length # out of bounds
    return false if maze[row][col] == 1 # impassable

    current_path << Point.new(row, col)
    at_end = row == maze.length - 1 && col == maze[0].length - 1
    if at_end || get_path(maze, row, col += 1, current_path) || get_path(maze, row + 1, col, current_path)
      @viable_path = current_path
      return true
    end
    false
  end
  @viable_path = nil
  return nil if maze.nil? || maze.empty?

  get_path(maze, 0, 0, [])
  return false if @viable_path.nil?

  @viable_path.map { |p| [p.row, p.col].join(',') }.join(' -> ')
end

puts 'Tests for traverse_maze'
result = traverse_maze(test_maze)
puts(result != false ? '*' : "FAILING: traverse_maze() returning #{result}")
result = traverse_maze(impassable_maze)
puts(result == false ? '*' : "FAILING: traverse_maze() returns #{result} instead of false")

puts 'Speed Test for Each Solution'

Benchmark.bm do |x|
  x.report { traverse_maze(test_maze) }
  x.report { traverse_maze(impassable_maze) }
end
