require 'find'

PLAYLIST_EXTENSION = ".m3u"
SUPPORTED_EXTENSION = ".mp3"

def init_dir_array(parent)
  directories = []
  Dir.foreach(parent) do |dir|
    dirpath = parent + "\\" + dir
    if File.directory?(dirpath) && dir != "." && dir != ".."
        #puts dirpath
        directories << dirpath
        directories + init_dir_array(dirpath)
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
while i < num_of_tracks
  active_directory = directories[rand(directories.length)]
  puts "Active directory = #{active_directory}"
  files = []
  Find.find(active_directory) do |f|
    if File.file?(f)
      fullfilepath = active_directory + "\\" + File.basename(f)
      if File.extname(fullfilepath) == SUPPORTED_EXTENSION
        files << fullfilepath
        #puts files
      end
    end
  end
  puts files[rand(files.length)]
  i += 1
end

