# frozen_string_literal: true

# Find Duplicates: You have an array with all the numbers from 1 to N,
# where N is at most 32,000. The array may have duplicate entries and
# you do not know what N is. With only 4 kilobytes of memory available,
# how would you print all duplicate elements in the array?
class BitVector
  def initialize(size)
    @bits = Array.new((size / 32.0).ceil, 0) # Use an array of integers as the bit vector
  end

  def set(i)
    @bits[i / 32] |= 1 << (i % 32)
  end

  def get(i)
    @bits[i / 32] & (1 << (i % 32)) != 0
  end
end

def find_duplicates(arr)
  bit_vector = BitVector.new(32_000)
  arr.each do |num|
    if bit_vector.get(num)
      puts num # This number is a duplicate
    else
      bit_vector.set(num)
    end
  end
end

# Example usage
arr = [1, 2, 3, 4, 5, 1, 6, 7, 8, 9, 2, 10]
find_duplicates(arr)

# With more detailed comments:

# Define a BitVector class to efficiently store and query presence of numbers
class BitVector
  def initialize(size)
    # Initialize an array of integers to act as the bit vector.
    # The size of the array is determined by dividing the maximum number (size)
    # by 32 (since there are 32 bits in an integer) and rounding up.
    # This ensures we have enough bits to represent each number from 1 to size.
    @bits = Array.new((size / 32.0).ceil, 0)
  end

  # Sets the bit for a given number to 1, indicating the number has been seen.
  def set(i)
    # Determine which integer in the array corresponds to the number i.
    # Set the bit within that integer using bitwise OR (|=).
    # The bit position is determined by i % 32, and 1 << (i % 32) creates a mask
    # to set just that bit.
    @bits[i / 32] |= 1 << (i % 32)
  end

  # Checks if the bit for a given number is set to 1 (i.e., if the number has been seen).
  def get(i)
    # Use bitwise AND (&) with a mask to isolate the bit corresponding to number i.
    # If the result is not 0, the bit is set (the number has been seen), so return true.
    # Otherwise, return false.
    @bits[i / 32] & (1 << (i % 32)) != 0
  end
end

# Function to find and print duplicates in an array
def find_duplicates(arr)
  # Create a BitVector large enough to represent numbers from 1 to 32,000.
  bit_vector = BitVector.new(32_000)
  arr.each do |num|
    # For each number in the array, check if its corresponding bit is already set.
    if bit_vector.get(num)
      # If the bit is set, the number is a duplicate, so print it.
      puts num
    else
      # If the bit is not set, this is the first time we're seeing the number.
      # Set the corresponding bit in the BitVector to mark the number as seen.
      bit_vector.set(num)
    end
  end
end

# Example usage of the find_duplicates function with a sample array
arr = [1, 2, 3, 4, 5, 1, 6, 7, 8, 9, 2, 10]
find_duplicates(arr)
