# This code solves the challenge at https://www.hackerrank.com/challenges/angry-children

def min_unfairness(array, spaces)
  array.sort!
  distance = spaces - 1
  min = array[distance] - array.first
  last_i = array.length - 1

  array.each_with_index do |num, i|
    low = num
    high_i = i + distance
    high_i <= last_i ? high = array[high_i] : break
    unfair = high - low
    min = unfair if min > unfair
  end

  min
end

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
for i in 0..n-1
      candy[i] = gets.to_i
end
ans = min_unfairness(candy, k) ### Compute answer from k, n, candies
puts ans
