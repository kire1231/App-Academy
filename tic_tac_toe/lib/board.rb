class Board
  attr_reader :grid, :marks

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def place_mark(pos, mark) #takes arr and sym: ([0,0], :x)
    row = pos[0]
    col = pos[1]
    grid[row][col] = mark
  end

  def empty?(pos) #takes arr: [0,0]
    row = pos[0]
    col = pos[1]
    return true if grid[row][col] == nil
    false
  end

  def winner
    (grid + cols + diagonals).each do |triple|
      return :X if triple == [:X, :X, :X]
      return :O if triple == [:O, :O, :O]
    end

    nil
  end

  def cols
    cols = [[], [], []]
    grid.each do |row|
      row.each_with_index do |mark, col_idx|
        cols[col_idx] << mark
      end
    end

    cols
  end

  def diagonals
    down_diag = [[0, 0], [1, 1], [2, 2]]
    up_diag = [[0, 2], [1, 1], [2, 0]]

    [down_diag, up_diag].map do |diag|
      diag.map { |row, col| grid[row][col] }
    end
  end

  def over?
    return true if grid.flatten.none? { |pos| pos == nil } || winner
    false
  end
end
