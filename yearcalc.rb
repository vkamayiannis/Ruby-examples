print "What is your name? "
name = gets.chomp
print "What is your age? "
age = gets.chomp.to_i
puts "#{name} was born in #{Time.now.year - age}"