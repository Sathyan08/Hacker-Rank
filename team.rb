# Enter your code here. Read input from STDIN. Print output to STDOUT
def max_subjects(start, remaining, subject_count, contestants)
  max = 0

  until remaining.empty?
    counter = 0

    second_start = remaining.pop

    subject_count.times do
      first_value = contestants[start]
      second_value = contestants[second_start]

      start += 1
      second_start += 1

      counter += 1 if (first_value == '1' || second_value == '1')
    end

    max = counter if max < counter
  end

  max
end


first_input = gets.strip.split(" ").map! {|i| i.to_i}
contestant_count = first_input.first
subject_count = first_input.last

contestants = ''

contestant_count.times { contestants += gets.strip  }

start_indexes = [0]

contestant_count.times { start_indexes << start_indexes.last + subject_count }

teams = []
max = 0

start_indexes.each_with_index do |start, i|
  remaining = start_indexes[(i + 1)..-1]
  best_for_contestant = max_subjects(start, remaining, subject_count, contestants)
  max = best_for_contestant if max < best_for_contestant
  teams << best_for_contestant
end

only_the_best = teams.keep_if { |num| num == max  }


# puts max

puts teams
