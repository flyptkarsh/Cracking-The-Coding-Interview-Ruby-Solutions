# frozen_string_literal: true

class Queue
  def initialize
    @store = []
  end

  def dequeue
    @store.pop
  end

  def enqueue(element)
    @store.unshift(element)
    self
  end

  def size
    @store.size
  end
end
