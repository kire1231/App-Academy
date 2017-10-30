# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  missing = []
  lowest = nums[0]
  highest = nums[-1]

  (lowest..highest).each do |n|
    next if nums.include?(n)
    missing << n
  end

  missing
end

# Write a method that given a string representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  digits = binary.chars
  sum = 0

  digits.reverse.each_with_index do |digit, idx|
    sum += (digit.to_i * 2 ** idx)
  end

  sum
end

class Hash

  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    true_hash = {}
    self.each { |k, v| true_hash[k] = v if prc.call(k, v) }
    true_hash
  end

end

class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.

  #merge takes proc that accepts 1 key and 2 values. 2 values are merges.
  #new_hash[key] = value of merge

  def my_merge(hash, &prc)
    new_hash = {}

    self.each { |k, v| new_hash[k] = v }
    hash.each { |k, v| new_hash[k] = v }

    if block_given?
      new_hash.each do |k, v|
        if self.keys.include?(k) && hash.keys.include?(k)
          new_hash[k] = prc.call(k, self[k], hash[k])
        end
      end
    end

    new_hash
  end

end

# The Lucas series is a sequence of integers that extends infinitely in both
# positive and negative directions.
#
# The first two numbers in the Lucas series are 2 and 1. A Lucas number can
# be calculated as the sum of the previous two numbers in the sequence.
# A Lucas number can also be calculated as the difference between the next
# two numbers in the sequence.
#
# All numbers in the Lucas series are indexed. The number 2 is
# located at index 0. The number 1 is located at index 1, and the number -1 is
# located at index -1. You might find the chart below helpful:
#
# Lucas series: ...-11,  7,  -4,  3,  -1,  2,  1,  3,  4,  7,  11...
# Indices:      ... -5, -4,  -3, -2,  -1,  0,  1,  2,  3,  4,  5...
#
# Write a method that takes an input N and returns the number at the Nth index
# position of the Lucas series.

def lucas_numbers(n)
  lucas_nums = [2, 1]

  if n > 0
    until n == 1
      lucas_nums << lucas_nums[-1] + lucas_nums[-2]
      n -= 1
    end
  elsif n < 0
    until n == -1
      lucas_nums << lucas_nums[-1] + lucas_nums[-2]
      n += 1
    end
  elsif n == 0
    lucas_nums = [2]
  end

  lucas_nums[-1]
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the longest palindrome in a given
# string. If there is no palindrome longer than two letters, return false.

def palindrome?(string)
  idx = 0
  while idx < string.length
    if string[idx] != string[(string.length - 1) - idx]
      return false
    end

    idx += 1
  end

  return true
end

def longest_palindrome(string)
  longest_length = 0

  start_index = 0
  while start_index < string.length
    length = 1
    while start_index + length <= string.length
      substring = string.slice(start_index, length)
      if palindrome?(substring) == true && substring.length > longest_length
        longest_length = substring.length
      end
      length += 1
    end
    start_index += 1
  end

  return longest_length if longest_length > 2

  false
end
