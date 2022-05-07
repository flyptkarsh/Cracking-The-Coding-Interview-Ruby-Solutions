# frozen_string_literal: true

# make the board for n queens
two_d_arr = []
8.times { two_d_arr << Array.new(8) }

# get all values for a given column
two_d_arr.map { |row| row[4] }
# get all values on a diagonal
(0..2).collect { |i| array[i][i] }
