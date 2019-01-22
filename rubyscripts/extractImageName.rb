p 'extract'

output_file = 'cd_hash.txt'

File.open(output_file,'w')

cd_name_array = []
cd_image_name_array = []

File.open('cd_view.html', 'r:utf-8') do |file|
    file.each_line do |line|
        # p line

        m = /「(.*?)」.*?\/assets\/img\/(.*?)_jacket.jpg/.match(line)
        # m = /\/assets\/img\/(.*?)_jacket.jpg/.match(line)
        # 「(.*?)」.*?\/assets\/img\/(.*?)_jacket.jpg
        if !m.nil? #m.length == 2
            p m[1] + ' -> ' + m[2]
            cd_name_array << m[1]
            cd_image_name_array << m[2]
         end


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



File.open(output_file,'a') do |file|    
    cd_name_array.each do |name|
        file.puts "\"" + name + "\","
    end
    cd_image_name_array.each do |image_name|
        file.puts "\"" + image_name + "\","
    end
end

# p cd_name_array
# p cd_image_name_array
