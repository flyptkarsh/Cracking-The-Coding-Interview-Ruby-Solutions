# frozen_string_literal: true

array = [[1, 2, 3, 4], [3, 4, 5, 6], [5, 6, 7, 8], [2, 3, 4, 5]]

def all_diagonals_row(array)
  size = array[0].size - 1
  all_diagonals = []
  array[0].each.with_index do |_v, index|
    curr_diagonal = []
    index.upto(size) do |i|
      curr_diagonal.push(array[i][i]) if array[i]
    end
    all_diagonals.push(curr_diagonal)
  end
  all_diagonals
end

def all_diagonals_for_matrix(array)
  diagonals = []
  array.each.with_index do |_row, index|
    all_diagonals_row(array[index..-1]).each do |arr|
      diagonals.push(arr) unless arr.empty?
    end
  end
  diagonals.select { |arr| arr.size > 1 }
end

p all_diagonals_for_matrix(array)
