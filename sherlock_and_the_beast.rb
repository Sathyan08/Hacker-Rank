def five_blocks(digits)
  fives = digits % 5
  fives % 3 == 0 ? (fives / 3) : 0
end

def three_blocks(digits)
  fives = digits % 5
  threes = digits - fives
  threes % 5 == 0 ? (threes / 5) : 0
end

def fives_string(digits)
  string = ''
  five_blocks(digits).times { string += "555" }
  string
end

def threes_string(digits)
  string = ''
  five_blocks(digits).times { string += "33333" }
  string
end

def max_decent(digits)
  string = fives_string(digits) + threes_string(digits)
  string.present? ? string.to_i : -1
end

inputs = gets.strip.to_i

inputs.times do
  input = gets.strip.to_i
  puts max_decent(input)
end
