class AnagramFinder

  def initialize(s1, s2)
    @counts_1 = add_counts(s1)
    @counts_2 = add_counts(s2)
    @possible_values = { }
  end

  def number_of_deletions
    @possible_values.keys.inject(0) { |sum, char| sum + find_difference(char) }
  end

  private

  def add_counts(s)
    counts = { }
    s.each_char do |char|
      counts.has_key?(char) ? counts[char] += 1 : counts[char] = 1
      @possible_values[char] = true
    end

    counts
  end

  def find_difference(char)
    diff = @counts_1[char] - @counts_2[char]
    diff.abs
  end

end
