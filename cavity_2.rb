require 'pry'

class CavityMap

  def call
    set_map
    mapped = @spaces.map { |space| space[:cavity_map] }
    rows = []
    mapped.each_slice(@dimensions) { |row| rows << row.join }
    puts rows
  end

  def add_spaces(input)
    depths = input.chars.map { |char| char.to_i }

    left_edge = 0
    right_edge = @dimensions - 1

    depths.each_with_index do |depth, index|
      space = { }
      space[:depth] = depth
      space[:cavity_map] = depth.to_s
      space[:edge] = (index == left_edge || index == right_edge)
      @spaces << space
    end

    def adjacents(row, col)
      [ find_space(row + 1, col), find_space(row - 1, col), find_space(row, col + 1), find_space(row, col - 1) ]
    end

  end

  private

  def initialize(dimensions)
    @dimensions = dimensions
    @spaces = []
  end

  def find_space(row, col)
    space = @spaces[@dimensions * row + col]
  end

  def to_row_and_column(index)
    col = index % @dimensions
    row = (index - col) / @dimensions
    return row, col
  end

  def set_map
    @spaces.each_with_index { |space, index| cavity_check(index) if !space[:edge] }
  end

  def cavity_check(index)
    @spaces[index][:cavity_map] = "X" if cavity?(index)
  end

  def cavity?(index)
    tested_space = @spaces[index]
    row, col = to_row_and_column(index)
    return false if adjacents(row, col).include?(nil)
    adjacents(row, col).all? { |space| space[:depth] < tested_space[:depth]}
  end


end

dimensions = gets.strip.to_i

cav_map = CavityMap.new(dimensions)

dimensions.times { cav_map.add_spaces(gets.strip) }

cav_map.call
