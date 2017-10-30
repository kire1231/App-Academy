
# # Pig Latin
#
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to
# the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end
# of the word, and then add an "ay" sound to the end of the word.
#
# (There are a few more rules for edge cases, and there are regional
# variants too, but that should be enough to understand the tests.)
#
# See <http://en.wikipedia.org/wiki/Pig_latin> for more details.

def translate(str)
  words = str.split
  pig_words = []
  words.each do |word|
    pig_words << latinize(word)
  end

  pig_words.join(" ")
end

def latinize(word)
  vowels = ["a", "e", "i", "o", "u"]

  if word[0..2] == "squ"
    word = word[3..-1] + "squay"
    word
  elsif word[0..1] == "qu"
    word = word[2..-1] + "quay"
    word
  else
    until vowels.include?(word[0])
      word = word[1..-1] + word[0]
    end
    word + "ay"
  end
end
