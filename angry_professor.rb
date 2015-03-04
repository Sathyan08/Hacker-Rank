# This code solves the challenge at https://www.hackerrank.com/challenges/angry-professor
def on_time?(num)
  num <= 0
end

def number_on_time(nums)
  on_time = nums.select { |num| on_time?(num) }
  on_time.count
end

def cancelled?(nums, threshold)
  number_on_time(nums) >= threshold ? "NO" : "YES"
end

inputs = gets.strip.to_i

inputs.times do
  first_line = gets.strip.split(' ').map { |num_string| num_string.to_i }
  threshold = first_line[1]
  nums = gets.strip.split(' ').map { |num_string| num_string.to_i }
  puts cancelled?(nums, threshold)
end

