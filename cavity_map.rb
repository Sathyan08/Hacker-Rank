require 'pry'

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
    neighbors = adjacents(row, col)
    adjacents(row, col).all? { |depth|  depth < cav }
  end

  def to_row_and_column(index)
    col = index % @dimensions
    row = (index - col) / @dimensions
    return row, col
  end

  def find_cavities
    cavities = []

    @spaces.each_with_index do |spot, index|
      row, col = to_row_and_column(index)
      cavities << index if cavity?(row, col)
    end

    cavities.each { |index| @spaces[index] = "X"  }
  end

  def display_cavities
    find_cavities
    @dimensions.times { puts make_lines }
  end

  def make_lines
    @copy ||= @dimensions

  end

end

dimensions = gets.strip.to_i

cav_map = Map.new(dimensions)

dimensions.times { cav_map.add_spaces(gets.strip) }

cav_map.display_cavities
