PLAYLIST_EXTENSION = ".m3u"
SUPPORTED_EXTENSION = ".mp3"

def init_dir_array(parent)
  directories = []
  sub = []
  Dir.foreach(parent) do |dir|
    dirpath = parent + "\\" + dir
    if File.directory?(dirpath) && dir != "." && dir != ".."
        directories << dirpath
		directories = directories + init_dir_array(dirpath)
	end
  end
  directories
end

print "Enter the parent directory: "
parent_dir = gets.chomp
print "Enter the desired number of tracks in the playlist: "
num_of_tracks = gets.chomp.to_i
print "Enter the filename of the playlist (m3u extension will be added: "
filename = gets.chomp + PLAYLIST_EXTENSION
directories = init_dir_array(parent_dir)
i = 0
begin
    file = File.open(filename, "w") 
	while i < num_of_tracks
	  active_directory = directories[rand(directories.length)]
	  #puts "ACTIVE DIRECTORY #{active_directory}"
	  files = []
	  mp3s = []
	  files = Dir.entries(active_directory).select{|f| !File.directory? f}
	  files.each_index  {|i| files[i] = active_directory + "\\" + files[i] }
	  files.each do |f|
	    #For some reason this did not work
		#if File.extname(f) != SUPPORTED_EXTENSION
		# files.delete(f)
		#end
		#puts f
		if File.extname(f) == SUPPORTED_EXTENSION
		  mp3s << f
		end
	  end
	  if mp3s.length > 0 
	    added_file = mp3s[rand(mp3s.length)] + "\n"
	    file.write(added_file)
	    i += 1
	  end
	end
rescue 
  puts "Error saving file"
ensure
   file.close unless file == nil
end
