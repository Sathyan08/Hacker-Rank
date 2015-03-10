#this code solves the challenge at https://www.hackerrank.com/challenges/palindrome-index

class PalindromeFinder

  def initialize(string)
    @last = string.length - 1
    @string = string
  end

  def first?(index)
    index == 0
  end

  def last?(index)
    index == @last
  end

  def deleted_at(index)
    (first?(index) || last?(index)) ? first_or_last_check(index) : string_without(index)
  end

  def first_or_last_check(index)
    first?(index) ? string_without_first : string_without_last
  end

  def string_without_first
    @string[1..-1]
  end

  def string_without_last
    @string[0..-2]
  end

  def string_without(index)
    before = index - 1
    after = index + 1
    @string[0..before] + @string[after..-1]
  end

  def palindrome?(string)
    string.reverse == string
  end

  def look_for_palindrome
    palindrome?(@string) ? -1 : find_deletion
  end

  def find_deletion
    chars = @string.chars
    chars.each_with_index do |char, index|
      substring = deleted_at(index)
      return index if palindrome?(substring)
    end
  end

end

inputs = gets.strip.to_i

inputs.times do
  pal = PalindromeFinder.new(gets.strip)
  puts pal.look_for_palindrome
end
