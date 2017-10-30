def reverser(&prc)
  sentence = prc.call
  words = sentence.split(" ")
  words.map { |word| word.reverse }.join(" ")
end

def adder(num = 1, &prc)
  num + prc.call
end

def repeater(num = 1, &prc)
  num.times { prc.call }
end
