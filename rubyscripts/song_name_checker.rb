song_view_file = './song_view.txt'
song_yml_file = '../test/fixtures/songs.yml'

songs_yml = '';

File.open(song_yml_file, 'r:utf-8') do |file|
    file.each_line do |line|
        songs_yml += line
    end
end

File.open(song_view_file, 'r:utf-8') do |file|
    file.each_line do |line|
        song_key = line.strip+'_song:'
        if(!songs_yml.include?(song_key))
            p song_key + ' is not contains'
        end
        # p song_key
        # vals = line.split("\t")
        # title = vals[1]
        # site_name = ""
        # case vals[2]
        # when "うたまっぷ"
        #     site_name = 'utamap'
        # end
        # url = vals[3].strip
        # arr << [title, site_name, url]
    end
end
