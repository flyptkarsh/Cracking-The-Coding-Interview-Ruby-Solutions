# frozen_string_literal: true

# 1.7 Rotate Matrix:

# Given an image represented by nxn matrix, where each pixel
# in image is 4 bytes, write a method to rotate the image
# by 90 degrees. (In place)

def rotate_matrix_90_degrees(matrix)
  # Get the dimensions of the original matrix
  n = matrix.length # Number of rows
  m = matrix[0].length # Number of columns in the first row, assuming all rows have equal columns

  # Initialize a new matrix with dimensions m x n
  new_matrix = Array.new(m) { Array.new(n) }

  # Copy elements from the original matrix to the new matrix in rotated positions
  n.times do |i|
    m.times do |j|
      new_matrix[j][n - 1 - i] = matrix[i][j]
    end
  end

  new_matrix
end

# Example usage
original_matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

rotated_matrix = rotate_matrix_90_degrees(original_matrix)
rotated_matrix.each { |row| p row }

# inplace rotation

def rotate_matrix_90_degrees_in_place(matrix)
  n = matrix.length # Assuming a square matrix

  # Transpose the matrix
  (0...n).each do |i|
    (i...n).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  # Reverse each row
  matrix.each(&:reverse!)

  matrix
end

# Example usage
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

rotate_matrix_90_degrees_in_place(matrix)
matrix.each { |row| p row }
