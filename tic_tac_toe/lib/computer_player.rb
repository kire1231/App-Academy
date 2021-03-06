class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []

    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if board[pos] == nil
      end
    end

    moves.each do |move|
      return move if wins?(move)
    end

    moves.sample
  end

  def wins?(move)
    board[move] = mark
    if board.winner == mark
      board[move] = nil
      true
    else
      board[move] = nil
      false
    end
  end


end
