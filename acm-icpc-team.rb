require 'pry'
# Enter your code here. Read input from STDIN. Print output to STDOUT
def team_subjects(s1, s2)
  total = 0
  s1.chars.each_with_index { |char, i| total += 1 if (s2[i] == 1 || char == 1) }
  total
end

def find_total_subjects(contestants)
  subjects_per_team = []

  contestants.each_with_index do |contestant, i|
    other_contestants = contestants[(i + 1)..-1]
    other_contestants.each do |other|
        subjects_per_team << team_subjects(contestant, other)
    end
  end

  subjects_per_team
end

def sorted_totals(contestants)
  find_total_subjects(contestants).sort
end

def max_subjects(sorted)
  sorted.last
end

def teams_with_max(sorted)
  most_subjects = max_subjects(sorted)

  only_highest = sorted.keep_if { |num_subjects| num_subjects == most_subjects }

  only_highest.count
end


first_input = gets.strip.split(" ").map! {|i| i.to_i}
num_of_contestants = first_input.first

contestants = []

num_of_contestants.times { contestants << gets.strip  }

sorted = sorted_totals(contestants)

puts max_subjects(sorted)
puts teams_with_max(sorted)

