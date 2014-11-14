def group_and_count(input)
  h = Hash.new(0)
  if input != nil
	  input.each {|x| h[x] += 1}
	  h
  end
  h.length > 0 ? h : nil
end

input = [1,1,2,2,2,3]

puts group_and_count(input)

input = nil

puts group_and_count(input)