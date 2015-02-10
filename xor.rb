def maxXor(a,b)
  range = (a..b).to_a
  xors = [ ]
  range.each_with_index do |num, i|
    range[i..-1].each { |num_2| xors << xor(num, num_2)  }
  end

  xors.max
end

def xor(num, num_2)

  num.to_s(2).length > num_2.to_s(2).length ? b = num.to_s(2).length : b = num_2.to_s(2).length

  a_binary = "%#{b}b" % num
  b_binary = "%#{b}b" % num_2

  xor_s = ''

  a_binary.chars.each_with_index do |num, i|
    num == b_binary[i] ? xor_s += "0" : xor_s += "1"
  end

  xor_s.to_i(2)
end

p maxXor(1,10)
