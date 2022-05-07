# frozen_string_literal: true

# Sieve of Eratosthenes
# Ruby has this built in:
# require 'prime'
# num = 350003
# primes = Prime::EratosthenesGenerator.new.take_while {|i| i <= num}
#
# primes.include?(num)

def sieve(max)
  # set up an array with all integers to the max
  primes = (0..max).to_a

  # 0 and 1 are nil, because they a not primes.
  primes[0] = nil
  primes[1] = nil

  # iterate through the primes array
  counter = 0
  primes.each do |prime|
    # skip if nil
    next unless prime
    # break if we are past the square root of the max value
    break if prime * prime > max

    counter += 1
    # start at the square of the current number, and step through.
    (prime * prime).step(max, prime) do |m|
      primes[m] = nil
    end
  end
  # Finally, return the compacted array.
  p "Solved for #{max} in #{counter} steps."
  primes.compact
end

def prime?(num)
  sieve(num).include?(num)
end

p prime?(105_557)
