require 'pry'

def first_square(start, finish)
  counter = start

  while counter <= finish
    root = Math.sqrt(counter)
    return root if perfect_square?(root)
    counter += 1
  end

  nil
end

def perfect_square?(root)
  root.to_i.to_f == root
end

def count_squares(start, finish)
  counter = first_square(start, finish)

  if counter
    squares = 0
  else
    return 0
  end

  while (counter ** 2) <= finish
    counter += 1
    squares += 1
  end

  squares
end



inputs = gets.strip.to_i

inputs.times do
  start, finish = gets.strip.split.map { |num| num.to_i }
  puts count_squares(start, finish)
end
