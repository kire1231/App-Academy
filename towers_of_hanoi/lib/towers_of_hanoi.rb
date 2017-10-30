# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize * plau * render * won? * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#


class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [ [3, 2, 1], [], [] ]
  end

  def play
    until won?
      render
      get_move
    end
    conclude
  end

  def get_move
    print "Enter which tower you'd like to move from/to (ex. 0 1)"
    input = gets.chomp
    from_tower, to_tower = input.split(" ").map(&:to_i)

    until valid_move?(from_tower, to_tower)
      from_tower, to_tower = get_valid_move
    end

    move(from_tower, to_tower)
  end

  def render
    top_row = towers.map { |tower| tower.length >= 3 ? tower[2].to_s : " " }
    mid_row = towers.map { |tower| tower.length >= 2 ? tower[1].to_s : " " }
    bot_row = towers.map { |tower| tower.length >= 1 ? tower[0].to_s : " " }

    puts "#{top_row.join(' ')}\n#{mid_row.join(' ')}\n#{bot_row.join(' ')}\n_ _ _"
  end

  def get_valid_move
    print "Please enter a valid move."
    input = gets.chomp
    input.split(" ").map(&:to_i)
  end

  def conclude
    puts "Congratulations, you've won!"
    render
  end

  def move(from_tower, to_tower)
    disc = towers[from_tower].pop
    towers[to_tower].push(disc)
  end

  def valid_move?(from_tower, to_tower)
    from = towers[from_tower]
    to = towers[to_tower]
    return false if from_tower > 2 || to_tower > 2 || from.empty?
    return false if !to.empty? && from.last > to.last
    true
  end

  def won?
    return true if towers[1].length == 3 || towers[2].length == 3
    false
  end

end



if __FILE__ ==$0
game1 = TowersOfHanoi.new

game1.play

end
