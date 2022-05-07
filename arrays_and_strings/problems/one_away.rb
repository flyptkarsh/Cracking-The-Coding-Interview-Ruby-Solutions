# frozen_string_literal: true

# 1.5 One Away
# There are three types of edits that can be performed on strings:
# insert a character, remove a character, or replace a character.
# Given two strings write a function that checks if the stings are
# one edit away form each other.

# The brute force would be to check all possible edits, but that would be too slow.

# The two strings will always be equal, or one char shorter or
# longer than each other if they are one edit away.

# removal is the inverse of insertion, you don't need to check both
def one_edit_away(first, second)
  if first.length == second.length
    one_edit_replace(first, second)
  elsif first.length + 1 == second.length
    one_edit_insert(first, second)
  elsif first.length - 1 == second.length
    one_edit_insert(first, second)
  else
    false
  end
end

def one_edit_replace(first, second)
  found_difference = false
  first.chars.each_with_index do |val, index|
    if val != second.chars[index]
      if found_difference
        return false
      else
        found_difference = true
      end
    end
  end
  true
end

def one_edit_insert(first, second)
  longer = first.length > second.length ? first : second
  shorter = first.length > second.length ? second : first
  longer.chars.each_with_index do |_val, index|
    word = longer.chars
    word.delete_at(index)
    return true if shorter == word.join('')
  end
  false
end

p one_edit_away('cat', 'hat')
p one_edit_away('crt', 'hat')
p one_edit_away('hats', 'hat')
p one_edit_away('rats', 'hat')
