# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char do |ch|
    str.delete!(ch) if ch == ch.downcase
  end
  str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  mid = str.length / 2
  if str.length.odd?
    return str[mid]
  end

  return str[mid-1..mid]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0
  str.each_char do |ch|
    if VOWELS.include?(ch)
      count += 1
    end
  end
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each do |num|
    product = product * num
  end
  product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  join = ""

   arr.each_index do |i|
    join += arr[i]
    join += separator unless i == arr.length - 1
  end

  join
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_string = ""
  chars = str.chars
  chars.each_index do |i|
    if i.odd?
      new_string += chars[i].upcase
    else
      new_string += chars[i].downcase
    end
  end
  new_string
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  new_words = []
  words = str.split
  words.each do |word|
    if word.length >= 5
      new_words << word.reverse
    else
      new_words << word
    end
  end
  new_words.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  ints = []
  (1..n).each do |num|
    if (num % 3 == 0) && (num % 5 == 0)
      ints << "fizzbuzz"
    elsif (num % 3 == 0) && (num % 5 != 0)
      ints << "fizz"
    elsif (num % 5 == 0) && (num % 3 != 0)
      ints << "buzz"
    else
      ints << num
    end
  end
  ints
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num == 1
  (2..num/2).each do |i|
    if num % i == 0
      return false
    end
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  factors = []
  (1..num).each do |i|
    if num % i == 0
      factors << i
    end
  end
  factors
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  prime_factors = []
  factors(num).each do |factor|
    prime_factors << factor if prime?(factor)
  end
  prime_factors
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  evens = []
  odds = []

  arr.each do |int|
    if int.even?
      evens << int
    else
      odds << int
    end
  end

  if evens.length > 1
    return odds[0]
  end
  
  evens[0]
end
