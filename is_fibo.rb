# This code solves the challenge at https://www.hackerrank.com/challenges/is-fibo

def is_fibo?(num)
  (num == 0 || num == 1) ? "IsFibo" : fibo_check(num)
end

def fibo_check(num)
  fibo = [0,1]

  while true
    newest = fibo[-1] + fibo[-2]
    return "IsFibo" if newest == num
    return "IsNotFibo" if newest > num
    fibo << newest
    fibo = fibo.last(2)
  end
end

inputs = gets.strip.to_i

inputs.times { puts is_fibo?(gets.strip.to_i) }
