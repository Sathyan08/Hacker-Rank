# this code solves the challenge at https://www.hackerrank.com/challenges/cut-the-sticks

class NumberCut

  def call
    @lengths.count > 0 ? cut : @cuts
  end

  private

  def initialize(lengths)
    @lengths = lengths.sort
    @cuts = []
  end

  def cut
    @cuts << @lengths.count
    shortest = @lengths.first
    @lengths.map! { |length| length - shortest }
    @lengths.select! { |length| length > 0 }
    call
  end

end
lengths = [5, 4, 4, 2, 2, 8]
puts NumberCut.new(lengths).call
