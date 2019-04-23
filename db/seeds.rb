name = '大丈夫'
song = Song.find_by(name: name);
if song
  song.note = nil
  song.save
else
  p '見つからない -> ' + name
end
