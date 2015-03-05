# This code solves the challenge at https://www.hackerrank.com/challenges/two-strings

def read_first(first)
  characters = { }

  first.each_char { |char| characters[char] = true }

  characters
end

def match?(first, second)
  first_chars = read_first(first)
  second.each_char { |char| return true if first_chars[char] == true }
  false
end

def substring?(first, second)
  match?(first, second) ? "YES" : "NO"
end

inputs = gets.strip.to_i

inputs.times do
  first = gets.strip
  second = gets.strip
  puts substring?(first, second)
end
