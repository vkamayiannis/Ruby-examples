def mineLocation field
  row = 0
  column = 0
  loc = [row, column]
  field.each do |first|
	column = 0
    first.each do |x|
	  if x.to_i == 1
		loc[0] = row
		loc[1] = column
	  end
	  column += 1
	end
    row += 1
  end
  loc
end

puts mineLocation([ [1, 0], [0, 0] ])
puts mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ])
puts mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ])