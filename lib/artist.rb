require "pry"
class Artist
attr_accessor :name

@@all= []

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

def add_song(song)
  song.artist = self
end

def songs
 Song.all.select {|song| song.artist == self}
end

def self.find_or_create_by_name(name)
  self.find(name) ? self.find(name) : self.create(name)
end

def self.create(name)
  artist = Artist.new(name)
  artist
end

def self.find(name)
  self.all.detect {|artist| artist.name == name}
end

def print_songs
self.songs.each {|name| puts name.name}
end

end
