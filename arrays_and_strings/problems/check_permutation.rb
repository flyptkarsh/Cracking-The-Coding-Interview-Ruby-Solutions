# given two strings check if a string is a permutation of another.
# solution one sort the strings
def check_permutation_brute_force?(str_1, str_2)
  str_1.chars.sort ==  str_2.chars.sort
end

# example
str_1 = "god"
str_2 = "dog"
check_permutation_brute_force?(str_1, str_2) # expect true
str_1 = "good"
str_2 = "dog"
check_permutation_brute_force?(str_1, str_2) # expect false

# Check the stings for identical char counts
def check_permutation_by_char_count?(str_1, str_2)
  str_1_char_count = count_chars(str_1)
  str_2_char_count = count_chars(str_2)
  return false if str_1_char_count.to_a.size != str_2_char_count.to_a.size
  str_1_char_count.each do |k, v|
    return false if str_2_char_count[k] != v
  end
end

def count_chars(str)
  char_hash = Hash.new(0)
  str.chars.each do |char|
    char_hash[char]+=1
  end
  char_hash
end

# example
str_1 = "god"
str_2 = "dog"
p check_permutation_by_char_count?(str_1, str_2)# expect true
str_1 = "good"
str_2 = "dog"
p check_permutation_by_char_count?(str_1, str_2) # expect false
