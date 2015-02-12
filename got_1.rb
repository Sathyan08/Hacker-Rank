# this code solves the problem at https://www.hackerrank.com/challenges/game-of-thrones/submissions/code/10992969

def set_counts(s)
  counts = {}
  s.each_char { |char| counts.has_key?(char) ? counts[char] += 1 : counts[char] = 1 }
  counts.sort_by { |char, count| -count }
end

def has_palindrome?(s)
  counts = set_counts(s)

  counts.reverse_each do |array|
    if array[1].odd?
      array[1] -= 1
      break
    end
  end

  first = ''
  second = ''

  counts.each do |char, count|
    until count == 0
      first += char
      count -= 1
      if count > 0
        second += char
        count -= 1
      end
    end
  end

  first == second
end

p has_palindrome?('aaabbbb')
