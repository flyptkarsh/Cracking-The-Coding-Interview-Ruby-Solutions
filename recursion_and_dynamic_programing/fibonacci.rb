# frozen_string_literal: true

# fibonacci numbers pg.131

# calculate the nth fibonacci number recursively
def fibonacci_recursive_basic(n)
  return 0 if n.zero?
  return 1 if n == 1

  fibonacci_recursive_basic(n - 1) + fibonacci_recursive_basic(n - 2)
end

# calculate the nth fibonacci number with memoization

# bad but working solution
def fibonacci(n)
  return n if n <= 1

  fibonacci(n - 1) + fibonacci(n - 2)
end

def fib_store(n)
  fib_arr = []
  (0..n).each { |x| fib_arr << fibonacci(x) }
  fib_arr
end

p fib_store(5)

# solution that effectively uses memoization and recursion
@fib_hash = {}

def better_fibonacci(n)
  @fib_hash[n] =
    if n <= 1
      n
    else
      @fib_hash[n] ||= better_fibonacci(n - 1) + better_fibonacci(n - 2)
    end
end

p better_fibonacci(1000)
