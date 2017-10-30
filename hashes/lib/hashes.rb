# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hsh = Hash.new
  words = str.split

  words.each do |word|
    hsh[word] = word.length
  end

  hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  ordered = hash.sort_by {|k,v| v}
  ordered.last.first

end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k_new, v_new|
    older[k_new] = v_new
  end

  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  counter_hash = Hash.new(0)
  letters = word.chars

  letters.each do |letter|
    counter_hash[letter] += 1
  end

  counter_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hsh = Hash.new
  arr.each {|el| hsh[el] = true }
  hsh.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  frequency_hash = {:even => 0, :odd => 0 }

  numbers.each do |num|
    frequency_hash[:even] += 1 if num.even?
    frequency_hash[:odd] += 1 if num.odd?
  end

  frequency_hash

end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  counter = Hash.new(0)
  characters = string.chars
  vowels = "aeiou"

  characters.each do |char|
    counter[char] += 1 if vowels.include?(char)
  end

  counter.sort_by { |k, v| v }.last.first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  students_with_bdays = students.select { |student, month| month >= 7 }
  names = students_with_bdays.keys
  result = []

  names.each_index do |idx1|
    ((idx1 + 1)...names.length).each do |idx2|
      result << [ names[idx1], names[idx2] ]
    end
  end

  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  uniq_specimens = specimens.uniq
  species_count = Hash.new(0)

  uniq_specimens.each do |species|
    species_count[species] = specimens.count(species)
  end

  num_species = uniq_specimens.length
  smallest = species_count.values.min
  largest = species_count.values.max

  num_species ** 2 * smallest / largest
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandalized_count = character_count(vandalized_sign)

  vandalized_count.all? do |char, count|
    normal_count[char.downcase] >= count 
  end
end

def character_count(str)
  counter = Hash.new(0)

  str.each_char do |char|
    next if char == " "
    counter[char.downcase] += 1
  end

  counter
end
