# This code solves the challenge at https://www.hackerrank.com/challenges/find-digits

def find_digits(num)
  num_string = num.to_s
  counter = 0

  num_string.each_char do |digit_string|
    digit = digit_string.to_i
    if digit != 0
      counter += 1 if num % digit == 0
    end
  end

  counter
end

inputs = gets.strip.to_i

inputs.times { puts find_digits(gets.strip.to_i) }
