require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = [] #song obj

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #creates a new song instance
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name_str)
    self.all.find {|song| song.name == name_str}
  end

  def self.find_or_create_by_name(title_str)
    song = self.find_by_name(title_str)
    song ? song : self.create_by_name(title_str)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(/\s\-\s|\./)
    song = self.new_by_name(filename_arr[1])
    song.artist_name = filename_arr[0]
    song
  end

  def self.create_from_filename(filename)
    filename_arr = filename.split(/\s\-\s|\./)
    song = self.create_by_name(filename_arr[1])
    song.artist_name = filename_arr[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# blank_space = Song.new
#
# binding.pry
# # ""
