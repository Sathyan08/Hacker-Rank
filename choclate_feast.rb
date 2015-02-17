def total_chocolates(money, cost, discount)
  chocolate = 0
  wrappers = 0

  until money < cost
    money -= cost
    chocolate, wrappers = unwrap_choclate(chocolate, wrappers)
    chocolate, wrappers = check_wrappers(chocolate, wrappers, discount)
  end

  chocolate, wrappers = check_wrappers(chocolate, wrappers, discount)

  chocolate
end

def unwrap_choclate(chocolate, wrappers)
  chocolate += 1
  wrappers += 1
  return chocolate, wrappers
end

def check_wrappers(chocolate, wrappers, discount)
  if wrappers == discount
    chocolate += 1
    wrappers = 1
  end

  return chocolate, wrappers
end
