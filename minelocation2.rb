def mineLocation field
  field.each_with_index {|x, i| return i, x.index(1) if x.include? 1}
end

puts mineLocation([ [1, 0], [0, 0] ])
puts mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ])
puts mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ])