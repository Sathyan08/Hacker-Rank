def candies_added(first, second, per_jar)
  per_jar * (second - first + 1)
end

first_line = gets.strip.split.map { |num| num.to_i }

jars = first_line[0]

number_of_operations = first_line[1]

total = 0

number_of_operations.times do
  operation = gets.strip.split.map { |num| num.to_i }
  first = operation[0]
  second = operation[1]
  per_jar = operation[2]
  total += candies_added(first, second, per_jar)
end

puts total / jars
