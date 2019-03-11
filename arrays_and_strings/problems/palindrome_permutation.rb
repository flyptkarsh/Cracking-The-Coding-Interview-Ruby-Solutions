# 1.4 Palindrome permutation
# Check a string to see if it is a permutation of a palindrome?

# a palendrome can only have one char with an odd count
def is_palendrome_permutation?(str)
  odd_count = count_chars(str).map{|k,v| v}.select {|i| i.odd?}.size
  odd_count > 1 ? false : true
end

def count_chars(str)
  char_counts = Hash.new(0)
  str.chars.each do |char|
    char_counts[char]+=1
  end
  char_counts
end

example_input = "tact coa" # expect true because "tacocat" is a palindrome
p count_chars(example_input)
example_input_2 = "ehmmmmmmmm" # epect false no palindromes
p count_chars(example_input_2)
