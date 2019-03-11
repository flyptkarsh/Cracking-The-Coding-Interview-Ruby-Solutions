#fibonacci numbers pg.131

# calculate the nth fibonacci number recursively
def fibonacci(nth)
  return 0 if nth == 0
  return 1 if nth == 1
  return fibonacci(nth - 1) + fibonacci(nth - 2)
end
