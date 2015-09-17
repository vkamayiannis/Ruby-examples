require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://www.imdb.com/title/tt2637294/fullcredits?ref_=tt_ql_1'
doc = Nokogiri::HTML(open(url))
doc.css("//table[@class='cast_list']/tr/td").each do |item|
	name = item.css(".itemprop") .text
	# if name != '' 
	#   puts name
	# end
	#character = item.css(".character").text
	character = doc.at_css("//td[@class='character']/div/a")
	puts "#{name} - #{character}"
end