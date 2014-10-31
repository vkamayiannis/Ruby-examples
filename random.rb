rndnum = rand(10)
x = -1
while x.to_i != rndnum
  print "Enter a number: "
  x = gets.chomp
  puts "Lower" if x.to_i > rndnum
  puts 'Higher' if x.to_i < rndnum
end