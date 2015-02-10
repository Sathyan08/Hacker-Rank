# This code solves the problem posted at - https://www.hackerrank.com/challenges/alternating-characters

def deletions(s)

  repeat = false

  characters = s.chars
  characters.each_with_index do |char, i|
    if char == characters[i + 1]
      characters.delete_at(i + 1)
      repeat = true
    end
  end

  repeat ? deletions(characters.join) : characters.join
end

def minimum_deletions(s)
  new_string = deletions(s)
  s.length - new_string.length
end

inputs = gets.strip.to_i
inputs.times { puts minimum_deletions(gets.strip) }
