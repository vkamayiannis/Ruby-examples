module Playlist

  PLAYLIST_EXTENSION = ".m3u"
  SUPPORTED_EXTENSION = ".mp3"

  #Function is outside of class for educational purposes
  def Playlist.init_dir_array(parent)
    directories = []
    sub = []
    Dir.foreach(parent) do |dir|
      dirpath = parent + "\\" + dir
      if File.directory?(dirpath) && dir != "." && dir != ".."
        directories << dirpath
        print "."
        directories = directories + init_dir_array(dirpath)
      end
    end
    directories
  end

  class PlayListError < StandardError
  end

  class Mp3PlayList
    attr_writer :filename

    def initialize(parent_dir, num_of_tracks)
      @parent_dir = parent_dir
      @num_of_tracks = num_of_tracks
      puts "Initializing directories"
      @dir_array = Playlist::init_dir_array(@parent_dir)
    end

    def create
      i = 0
      begin
        file = File.open(@filename, "w")
        while i < @num_of_tracks
          active_directory = @dir_array[rand(@dir_array.length)]
          files = []
          mp3s = []
          files = Dir.entries(active_directory).select{|f| !File.directory? f}
          files.each_index  {|i| files[i] = active_directory + "\\" + files[i] }
          files.each do |f|
            #For some reason this did not work
            #if File.extname(f) != SUPPORTED_EXTENSION
            # files.delete(f)
            #end
            if File.extname(f) == Playlist::SUPPORTED_EXTENSION
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
        raise PlayListError.new("Error creating playlist")
      ensure
        if file != nil
          file.close
          puts "\nPlaylist created successfully"
        end
      end
    end
  end
end

print "Enter the parent directory: "
parent_dir = gets.chomp
print "Enter the desired number of tracks in the playlist: "
num_of_tracks = gets.chomp.to_i
print "Enter the filename of the playlist (m3u extension will be added: "
filename = gets.chomp + Playlist::PLAYLIST_EXTENSION
pl = Playlist::Mp3PlayList.new(parent_dir, num_of_tracks)
pl.filename = filename
pl.create
