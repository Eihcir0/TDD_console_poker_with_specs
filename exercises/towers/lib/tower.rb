class Tower

  attr_accessor :columns

  def initialize
    @columns = [[3,2,1], [], []]
  end

  def move(from, to)
    raise "can't do that buddy" unless from.between?(0,2) && to.between?(0,2)
    raise "can't do that buddy" if @columns[from].empty?
    unless @columns[to] == []
      raise "can't do that buddy" if @columns[to].last < @columns[from].last
    end
    @columns[to] << @columns[from].pop
  end

  def won?
    @columns == [[], [3,2,1], []] || @columns ==  [[], [], [3,2,1]]
  end


end#class
