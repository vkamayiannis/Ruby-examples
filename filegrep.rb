print "Enter a sentence: "
sentence = gets.chomp
# correct regular expression here
pattern = Regexp.new(" " + sentence.upcase + " ")
puts pattern
begin
	f = File.new("example.txt", "r")
	linenum = 1
	while (line = f.gets)
	  if line.upcase =~ pattern
		puts "Linenum: #{linenum} Line: #{line}"
	  end
	  linenum += 1
	end
	f.close
rescue => err
  puts "#{err}"
  err
end