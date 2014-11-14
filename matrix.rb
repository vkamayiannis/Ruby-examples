def matrixAddition(a, b)
  s = []
  a.each_with_index do |x, idx|
    d = []
    x.each_with_index do |y, idx2| 
	    d << a[idx][idx2] + b[idx][idx2]
	  end
    s << d
  end 
  s
end

puts matrixAddition([[1, 2], [1, 2]], [[2, 3], [2, 3]])