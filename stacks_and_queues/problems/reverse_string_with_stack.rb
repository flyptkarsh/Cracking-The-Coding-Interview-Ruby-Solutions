# frozen_string_literal: true

# Stack | Set 3 (Reverse a string using stack)
# Given a string, reverse it using stack. For example “GeeksQuiz” should be converted to “ziuQskeeG”.
#
# Following is simple algorithm to reverse a string using stack.
#
# 1) Create an empty stack.
# 2) One by one push all characters of string to stack.
# 3) One by one pop all characters from stack and put
#    them back to string.
#
# Implementing a simple stack class
class Stack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(element)
    @store.push(element)
    self
  end

  def size
    @store.size
  end
end

def reverse_with_stack(str)
  stack = Stack.new
  str.chars.each do |value|
    stack.push(value)
  end
  str.chars.map.with_index do |_value, index|
    str[index] = stack.pop
  end
  str
end
