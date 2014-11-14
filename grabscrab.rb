def grabscrab anagram, dictionary
  s = []
  dictionary.each do |word|
    i = 0
	if word.length == anagram.length
		anagram.length.times do
		  break if word.count(anagram[i]) != anagram.count(anagram[i])
		  break if !word.include? anagram[i]
		  i += 1
		end
		s << word if i == word.length
	end
  end
  s
end

def grabscrab2 anagram, dictionary
  dictionary.select(|w| anagram.chars.sort == w.chars.sort}
end

puts grabscrab("oob", ["bob", "baobab"])
puts grabscrab("ainstuomn", ["mountains", "hills", "mesa"])
puts grabscrab("oolp", ["donkey", "pool", "horse", "loop"])
puts grabscrab("ourf", ["one","two","three"])