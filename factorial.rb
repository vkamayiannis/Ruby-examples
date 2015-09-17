print "Type a number: "
number = gets.chomp.to_i
x = 1
fact = 1
while x <= number
  fact *= x
  x += 1
end
puts "test for git from koding"
puts fact