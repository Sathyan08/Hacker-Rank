def servings(cuts)
  half = cuts / 2
  cuts.even? ? (horizontal, vertical = half, half) : (horizontal, vertical = half, half + 1)
  horizontal * vertical
end

inputs = gets.strip.to_i

inputs.times do
  cuts = gets.strip.to_i
  puts servings(cuts)
end
