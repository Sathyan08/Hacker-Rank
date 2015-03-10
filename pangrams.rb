# this code solves the challenge at https://www.hackerrank.com/challenges/pangrams
letters = ('a'..'z').to_a
letters_used = { }

letters.each { |letter| letters_used[letter] = false }

s = gets.strip.downcase

s.each_char { |letter| letters_used[letter] = true  }

letters_used.values.all? { |boolean| boolean == true } ?  message = "pangram" : message = "not pangram"
puts message
