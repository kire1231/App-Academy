class Book
  SMALL_WORDS = ["the", "a", "an", "of", "and", "in", "over", "on"]

  attr_reader :title

  def title=(title)
    title_words = title.split(" ")

    new_words = title_words.map.with_index do |word, idx|
      if SMALL_WORDS.include?(word) && idx != 0
        word
      else
        word.capitalize
      end
    end

    @title = new_words.join(" ")

  end

end
