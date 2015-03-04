def possibilities(stone_count, a, b)
  number_of_a = stone_count - 1
  number_of_b = 0
  possibilities = []

  while number_of_a >= 0
    possibility = a * number_of_a + b * number_of_b
    possibilities << possibility
    number_of_a -= 1
    number_of_b += 1
  end

  possibilities.join(' ')
end

inputs = gets.strip.to_i

inputs.times do
  input = []
  3.times { input << gets.strip.to_i }
  stone_count = input[0]
  a = input[1]
  b = input[2]
  print possibilities(stone_count, a, b)
  puts
end
