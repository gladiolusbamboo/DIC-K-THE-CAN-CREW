output_file1 = 'lyric_urls.yml'
output_file2 = 'lyric_url_songs.yml'

File.open(output_file1,'w')
File.open(output_file2,'w')

arr = []

File.open('input.txt', 'r:utf-8') do |file|
    file.each_line do |line|
        vals = line.split("\t")
        title = vals[1]
        site_name = ""
        case vals[2]
        when "うたまっぷ"
            site_name = 'utamap'
        end
        url = vals[3].strip
        arr << [title, site_name, url]
    end
end

arr.each do | val |
    File.open(output_file1,'a') do |file|
        file.puts("#{val[0]}_url: ")
        file.puts("  url: #{val[2]}")
        file.puts("  lyric_website: #{val[1]}")
        file.puts()
    end
    File.open(output_file2, 'a') do |file|
        file.puts("#{val[0]}_url_#{val[0]}_song: ")
        file.puts("  lyric_url: #{val[0]}_url")
        file.puts("  song: #{val[0]}_song")
        file.puts()
    end
end

# takaoni_url_takaoni_song:
#   lyric_url: takaoni_url
#   song: takaoni_song

# kankeri_url_kankeri_song:
#   lyric_url: kankeri_url
#   song: kankeri_song

# kyoukaraashita_url_kyoukaraashita_song:
#   lyric_url: kyoukaraashita_url
#   song: kyoukaraashita_song

# takaoni_url:
#  url: http://www.utamap.com/showkasi.php?surl=B16234
#  lyric_website: utamap

#kankeri_url:
#  url: http://www.utamap.com/showkasi.php?surl=B16235
#  lyric_website: utamap

# kyoukaraashita_url:
#  url: http://www.utamap.com/showkasi.php?surl=B16235
#  lyric_website: utamap

