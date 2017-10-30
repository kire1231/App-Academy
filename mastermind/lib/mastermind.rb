class Code
  PEGS = {
    "R" => :red,
    "O" => :orange,
    "Y" => :yellow,
    "G" => :green,
    "B" => :blue,
    "P" => :purple,
  }

  attr_reader :pegs

  def self.parse(code_string)
    chars = code_string.chars.map(&:upcase)
    raise ArgumentError unless chars - PEGS.keys == []
    pegs = chars.map { |char| PEGS[char] }
    Code.new(pegs)
  end

  def self.random
    pegs = []
    4.times { pegs << PEGS.values.sample }
    Code.new(pegs)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](idx)
    pegs[idx]
  end

  def exact_matches(code_guess)
    matches = 0
    pegs.each_index do |idx|
      matches += 1 if self[idx] == code_guess[idx]
    end
    matches
  end

  def near_matches(code_guess)
    other_color_counts = code_guess.color_counts

    near_matches = 0
    self.color_counts.each do |color, count|
      next unless other_color_counts.has_key?(color)

      near_matches += [count, other_color_counts[color]].min
    end

    near_matches - self.exact_matches(code_guess)
  end

  def ==(code_guess)
    return false unless code_guess.class == Code
    self.pegs == code_guess.pegs
  end

  def color_counts
    color_counts = Hash.new(0)

    @pegs.each do |color|
      color_counts[color] += 1
    end

    color_counts
  end

end


class Game
  MAX_TURNS = 10

  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play
    MAX_TURNS.times do
      guess = get_guess

      if guess == @secret_code
        puts "You guessed the secret code!"
        return
      end

      display_matches(guess)
    end

    puts "You did not guess the code..."
  end

  def get_guess
    puts "Please enter a guess. Ex: RGYB"

    begin
      Code.parse(gets.chomp)
    rescue
      puts "Error parsing code!"
      retry
    end
  end

  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)

    puts "exact matches:  #{exact_matches}"
    puts "near matches: #{near_matches}"
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
