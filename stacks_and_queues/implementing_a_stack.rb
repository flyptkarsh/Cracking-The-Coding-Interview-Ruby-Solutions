# frozen_string_literal: true

class Stack
  def initialize
    @store = []
  end

  def peek
    @store[-1]
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
