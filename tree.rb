class Branches

  @@know_nothings = []

  def self.make_tree(array)
    @@tree = {}
    array.each do |e|
      @@tree[e] = Branch.new
    end

    @@list
  end

  def self.place_player(player, subject_count)
    player.unknowns.length == subject_count? @@know_nothings << player.id : self.find_branch(player)
  end

  def self.find_branch(player)
    known = player.knowns.last
    @@tree[known].table(player)
  end

####instance methods

  def initialize
    @children = { }
    @list = []
  end

  def table(player)
    player.knowns.empty?  @children[value].add_to_list(player) : extend_branch(player)
  end

  def extend_branch(player)
    value = player.unknowns.pop
    @children[value] = Branch.new if !@children.has_key?(value)
    @children[value].table(player)
  end

  def add_to_list(player)
    @list << player
  end

end
