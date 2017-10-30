 # Calculator
#
# you will build a simple calculator script with the following methods:
#
# `add` takes two parameters and adds them
#
# `subtract` takes two parameters and subtracts the second from the first
#
# `sum` takes an *array* of parameters and adds them all together
#
# # Warning
#
# You may not have enough knowledge yet to complete `sum`. You will
# probably need to use **loops** (e.g. `while`) or **iterators**
# (e.g. `each`) to get the tests to pass.
#
# # Bonus
#
# There are also some bonus exercises for when you finish the regular
# ones. The bonus round will help teach you test-driven *development*,
# not simply test-guided *learning*.
#
# Your mission, should you choose to accept it, is to write *tests*
# for three new methods:
#
# * `multiply` which multiplies two numbers together
# * `power` which raises one number to the power of another number
# * `[factorial](http://en.wikipedia.org/wiki/Factorial)` (check
#   Wikipedia if you forgot your high school math).


def add(i, j)
  i + j
end

def subtract (i, j)
  i - j
end

def sum(arr)
  return 0 if arr.empty?
  arr.reduce(:+)
end

def multiply(*numbers)
  product = 1
  numbers.each { |number| product *= number }
  product
end

def power(base, exponent)
  base ** exponent
end

def factorial(n)
  return 1 if n == 0
  product = 1
  n.downto(1).each { |num| product *= num }
  product
end
