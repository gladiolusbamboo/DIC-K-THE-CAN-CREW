require 'yaml'

song_key = ARGV[0]

yaml_filename = "./" + song_key + ".yml"

yaml_data = open(yaml_filename, 'r') { |f| YAML.load(f) }

File.open("./" + song_key + "_seed.rb", "w") do |f| 
  f.puts("artist_name =    ''")
  f.puts("lyricUrl_url =   ''")
  f.puts("cd_name =        ''")
  f.puts("cd_released_at = ''")
  f.puts("song_name =      ''")
  f.puts("song_lyricist =  ''")
  f.puts("song_composer =  ''")
  f.puts("song_arranger =  ''")
  f.puts("cds_name = []")

  f.puts("")

  f.puts("artist = Artist.find_by(name: artist_name) || Artist.create(name: artist_name)")
  f.puts("cd = Cd.find_by(name: cd_name) || Cd.create(name: cd_name, released_at: cd_released_at)")
  f.puts("")
  f.puts("if lyricUrl_url")
  f.puts("  lyricUrl = LyricUrl.create(")
  f.puts("    url: lyricUrl_url,")
  f.puts("    lyric_website_id: LyricWebsite.find_by(name: 'うたまっぷ').id")
  f.puts("  )")
  f.puts("end")
  f.puts("")
  f.puts("song = Song.create(")
  f.puts("  lyric_url_id: lyricUrl ? lyricUrl.id : nil,")
  f.puts("  name: song_name,")
  f.puts("  lyricist: song_lyricist,")
  f.puts("  composer: song_composer,")
  f.puts("  arranger: song_arranger,")
  f.puts("  cd_id: cd.id,")
  f.puts("  artist_id: artist.id")
  f.puts(")")
  f.puts("if lyricUrl")
  f.puts("  LyricUrlSong.create(")
  f.puts("    lyric_url_id: lyricUrl.id,")
  f.puts("    song_id: song.id")
  f.puts("  )")
  f.puts("end")
  f.puts("CdSong.create(")
  f.puts("  cd_id: cd.id,")
  f.puts("  song_id: song.id")
  f.puts(")")

  f.puts("")

  yaml_data.each do | data |
    val = data[1]
    sngr = val['singer']
    if sngr == 'bypharthedopest'
      sngr = 'by phar the dopest'
    end
    f.puts("singer = Singer.find_by(name: '#{sngr.upcase}')")
    f.puts("lyrict_type = LyricType.find_by(name: '#{val['lyric_type'].upcase}')")    
    f.puts("Lyric.create(")
    f.puts("  song_id: song.id,")
    f.puts("  singer_id: singer.id,")
    f.puts("  lyric_type_id: lyrict_type.id,")
    f.puts("  part_lyric_order: #{val['part_lyric_order']},")
    f.puts("  lyric: '#{val['lyric'].gsub("'","\\\\'")}',")
    f.puts("  ruby: '#{val['ruby']}',")
    f.puts("  lyric_with_ruby: '#{val['lyric_with_ruby'].gsub("'","\\\\'")}',")
    f.puts("  lyric_order: #{val['lyric_order']},")
    f.puts(")")  
    f.puts("")
  end
end

