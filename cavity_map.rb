class Map
  attr_reader :spaces, :dimensions

  def initialize(n)
    @spaces = []
    @dimensions = n
  end

  def add_spaces(nums_string)
    nums_string.each_char { |num| @spaces << num.to_i  }
  end

  def space(row, col)
    spaces[@dimensions * row + col]
  end

  def edge?(row, col)
    (row == 0 || row == @dimensions) || (col == 0 || col == @dimensions)
  end

  def adjacents(row, col)
    [space(row - 1, col), space(row + 1, col), space(row, col - 1), space(row, col + 1)]
  end

  def cavity?(row, col)
    return false if edge?(row, col)
    cav = space(row, col)
    adjacents(row, col).all? { |depth| depth < cav }
  end

  def to_row_and_column(index)
    col = index % @dimensions
    row = index - col
    row, col
  end

  def find_cavities
    @spaces.each_with_index do |space, index|
      row, col = to_row_and_column(index)
      @spaces[index] = "X" if cavity?(row, col)
    end
  end

  def display_cavities
    find_cavities
    @dimensions.times { puts @spaces.slice!(@dimensions) }
  end

end
