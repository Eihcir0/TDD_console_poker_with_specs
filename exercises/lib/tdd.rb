class Array

  def my_uniq
    res = []
    self.each do |ele|
      res << ele unless res.include?(ele)
    end
    res
  end

  def two_sum
    results = []
    (0...length).each do |i|
      ((i + 1)...length).each do |j|
       results << [i] + [j] if self[i] + self[j] == 0
     end
   end
   results
  end

  def  my_transpose
    results = Array.new(length){Array.new(length)}
    (0...length).each do |i|
      (0...length).each do |j|
        results[i][j] =self[j][i]
      end
    end
    results
  end

  def stock_picker
    result = [0,1]
    #result = [3,4]
    (0...(length - 1)).each do |i|
      ((i + 1)...length).each do |j|
        result = [i, j] if (self[j] - self[i]) > (self[result[1]] - self[result[0]])
      end
    end
    result
  end

end
