def factorial(x)
  return 0 if x < 0
  return 1 if x == 1
  return x * factorial(x - 1) if x > 1
end

print "Enter a number: "
number = gets.chomp.to_i
fact = factorial(number)
puts fact