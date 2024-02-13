# frozen_string_literal: true

# 8.10 Paint Fill: Implement the "Paint fill" function that one might see on many image editing programs.
# That is given a screen (represented by a 2d array of colors) a point and a new color,
# fill in the surrounding area until the color changes from the original color.
def paint_fill(screen, x, y, new_color, original_color = nil)
  # Check for out-of-bounds coordinates
  return if x < 0 || x >= screen.length || y < 0 || y >= screen[0].length

  # If original_color is not set, use the color of the starting point
  original_color = screen[x][y] if original_color.nil?

  # Return if the cell is not of the original color or already filled with the new color
  return if screen[x][y] != original_color || screen[x][y] == new_color

  # Fill the color
  screen[x][y] = new_color

  # Recursively fill the surrounding cells
  paint_fill(screen, x + 1, y, new_color, original_color) # right
  paint_fill(screen, x - 1, y, new_color, original_color) # left
  paint_fill(screen, x, y + 1, new_color, original_color) # down
  paint_fill(screen, x, y - 1, new_color, original_color) # up
end

# Example usage
screen = [
  [1, 1, 1, 1, 1],
  [1, 1, 2, 2, 1],
  [1, 2, 2, 2, 1],
  [1, 1, 1, 1, 1]
]

x = 2 # Starting X coordinate
y = 2 # Starting Y coordinate
new_color = 3 # New color to fill

paint_fill(screen, x, y, new_color)

# Print the updated screen
screen.each do |row|
  puts row.join(' ')
end
