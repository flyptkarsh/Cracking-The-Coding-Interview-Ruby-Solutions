class Stack
  def initialize
    @store = Array.new
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
