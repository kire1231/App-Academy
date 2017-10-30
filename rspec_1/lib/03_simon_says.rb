def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, num = 2)
  new_str = ""
  (num - 1).times do |num|
    new_str += str + " "
  end
  new_str += str
  new_str
end

def start_of_word(str, num_letters)
  str[0...num_letters]
end

def first_word(str)
  str.split.first
end

def titleize(str)
  words = str.split
  small_words = ["a", "of", "and", "over", "the", "with", "to"]
  words.each do |word|
    word.capitalize! unless small_words.include?(word)
  end
  words[0].capitalize!
  words[-1].capitalize!
  words.join(" ")
end
