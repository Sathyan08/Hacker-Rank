# # this code solves the challenge at https://www.hackerrank.com/challenges/the-love-letter-mystery

# #1. find the midpoint
# mid = s.length / 2

# #2. get the first half and the second half.  Flip the second half

# first = s.chars[0..mid]
# second = s.chars[mid..-1].reverse

# #3. Zip the first half and second half.  Determine which char is higher

# first.zip(second)

#4. Call .next on the lower value until it == the higher value.  Increase counter by one.
def distance(a,b)
  a > b ? (higher, lower = a, b) : (higher, lower = b, a)
  counter = 0

  until lower == higher
    lower = lower.next
    counter += 1
  end

  counter
end
