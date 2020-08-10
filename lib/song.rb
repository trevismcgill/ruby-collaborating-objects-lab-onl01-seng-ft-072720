class Song
attr_accessor :name, :artist

@@all = []

def initialize(name)
  @name = name
save
end

def save
  @@all << self
end

def self.all
  @@all
end

def artist_name=(name)
  self.artist = Artist.find_or_create_by_name(name)
  artist.add_song(self)
end

def self.new_by_filename(filename)
  file = filename.split(" - ")
  song = Song.new(file[1])
  song.artist_name=(file[0])
  song
end

end
