# Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?

def is_unique_chars?(str)
  char_set = Hash.new()
  str.chars.each do |char|
    if char_set[char]
      return false
    else
      char_set[char] = true
    end
  end
  return true
end

p is_unique_chars?("bobloblaws") # expect false
p is_unique_chars?("asdfghi") # expect true
