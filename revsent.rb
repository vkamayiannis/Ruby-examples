print "Type a sentence: "
sentence = gets.chomp
print "Type a number: "
number = gets.chomp.to_i
i = 1
while i <= number
  puts sentence.reverse
  i += 1
end