def flipbits(num)
  bit_map = { "1" => "0", "0" => "1" }

  bit_string = num.to_s(2).rjust(32, '0')
  mapped = bit_string.chars.map { |char| bit_map[char] }
  flipped = mapped.join
  flipped.to_i(2)
end

inputs = gets.to_i

numbers = []

inputs.times do
  input = gets.strip.to_i
  numbers << input
end

numbers.each { |num| puts flipbits(num) }
