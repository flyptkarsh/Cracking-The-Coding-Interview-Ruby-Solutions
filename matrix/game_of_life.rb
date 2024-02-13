# frozen_string_literal: true

# The Game of Life, invented by mathematician John Horton Conway, is a cellular automaton—a zero-player game, meaning its evolution is determined by its initial state, requiring no further input. It's played on a grid of square cells, each of which is in one of two possible states: alive or dead. Every cell interacts with its eight neighbors, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

# Any live cell with fewer than two live neighbors dies, as if by underpopulation.
# Any live cell with two or three live neighbors lives on to the next generation.
# Any live cell with more than three live neighbors dies, as if by overpopulation.
# Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
# The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously.

# Here's a simple Ruby implementation of the Game of Life:

class GameOfLife
  def initialize(board)
    @board = board
    @height = board.size
    @width = board[0].size
  end

  def next_generation
    new_board = Array.new(@height) { Array.new(@width, 0) }

    @board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        live_neighbors = count_live_neighbors(y, x)

        new_board[y][x] = if cell == 1 && live_neighbors.between?(2, 3)
                            1
                          elsif cell.zero? && live_neighbors == 3
                            1
                          else
                            0
                          end
      end
    end

    @board = new_board
  end

  def display
    @board.each do |row|
      puts row.map { |cell| cell == 1 ? '█' : ' ' }.join
    end
  end

  private

  def count_live_neighbors(y, x)
    neighbors = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1],           [0, 1],
      [1, -1], [1, 0], [1, 1]
    ]

    live_neighbors = 0
    neighbors.each do |dy, dx|
      ny = y + dy
      nx = x + dx

      live_neighbors += @board[ny][nx] if ny.between?(0, @height - 1) && nx.between?(0, @width - 1)
    end

    live_neighbors
  end
end

# Example usage
board = [
  [0, 1, 0, 0, 0],
  [1, 0, 0, 1, 1],
  [1, 1, 0, 0, 1],
  [0, 1, 0, 0, 0],
  [1, 0, 0, 0, 1]
]

game = GameOfLife.new(board)
puts 'Original Generation:'
game.display
puts "\nNext Generation:"
game.next_generation
game.display
