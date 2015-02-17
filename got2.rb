require 'pry'

class Player

  attr_reader :id, :subjects, :knowns, :unknowns

  @@id_counter = 0

  def initialize(subjects)
    @@id_counter += 1
    @id = @@id_counter
    @subjects = subjects.chars
    find_knowns_and_unknowns
  end

  def find_knowns_and_unknowns
    @knowns = []
    @unknowns = []
    @knowns.each_with_index do |char, i|
      char == '1' ? @knowns << i : @unknowns << i
    end
  end

end

p = Player.new('11010')

binding.pry
