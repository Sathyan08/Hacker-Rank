# this code solves the challenge at https://www.hackerrank.com/challenges/the-love-letter-mystery

def distance(a,b)
  a > b ? (higher, lower = a, b) : (higher, lower = b, a)
  counter = 0

  until lower == higher
    lower = lower.next
    counter += 1
  end

  counter
end

def min_palindrome(s)
  mid = s.length / 2 - 1
  if s.length.even?
    first, second = s.chars[0..mid], s.chars[(mid + 1)..-1].reverse
  else
    first, second = s.chars[0..(mid)], s.chars[(mid + 2)..-1].reverse
  end

  matches = first.zip(second)
  matches.inject(0) { |sum, match| sum + distance(match[0], match[1]) }
end

inputs = gets.strip.to_i
inputs.times { puts min_palindrome(gets.strip) }
