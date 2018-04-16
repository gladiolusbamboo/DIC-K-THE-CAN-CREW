module SearchHelper
  def show_searchwords searchtype, info_arr, searchword
    content_tag(:ul) do
      # info_arrはLyricモデルの配列
      info_arr.each do |info|
        lyric_with_ruby = info.lyric_with_ruby
        if(searchtype != 'ルビ検索')
          lyric_original = info.lyric
          lyric_decoded = decodeLyricWithRuby(:Lyric, lyric_with_ruby)
          # pp "lyric_decoded = #{lyric_decoded}"          
        else
          lyric_original = info.ruby
        end

        index_arr = []

        # 正規表現だとマッチングが重なる部分が
        # うまくいかないのでindex()を使う
        offset = 0
        while (index = lyric_original.index(searchword, offset)) do
          index_arr << index
          offset = index + 1
        end

        # index_arrにはsearchwordの出現位置が格納されている
        index_arr.each do |index|
          pp "index = #{index}"
          index_modified = modifyIndex(index, lyric_decoded)
          # pp "lyric_original = #{lyric_original}"
          logger.info "lyric_original = #{lyric_original}"
          concat(
            content_tag(:li) do
              # lyricの先頭付近にsearchwordがあった場合の対策
              start_index = index_modified - 5
              if start_index < 0 
                start_index = 0
              end
              length = index_modified - start_index
              # pp "lyric_original = #{lyric_original}"
              # pp "start_index = #{start_index}"
              # pp "length = #{length}"
              
              # searchword直前の５文字切り出し
              concat lyric_decoded.slice(start_index,length)
              # searchwordを切り出して強調
              concat content_tag(:b, searchword)
              # searchword直後の５文字切り出し
              concat lyric_decoded.slice(index_modified+searchword.length, 5)
              concat "(#{info.lyric_type.name}#{info.part_lyric_order} by #{info.singer.name})"
            end
          )
        end
      end
    end
  end

  private
    def decodeLyricWithRuby type, lyric_with_ruby
      # pp "type = #{type}"
      regex = /\\{(.*?),(.*?)\\}/
      matches = []
      if type == :Lyric
        logger.info "lyric_with_ruby = #{lyric_with_ruby}"

        lyric_tmp = lyric_with_ruby.clone
        lyric_return = lyric_with_ruby.clone

        while (match = regex.match(lyric_tmp)) do
          matches << match
          lyric_tmp = $'
          lyric_return.gsub!(match[0],match[1])
        end

        lyric_return.strip!
      end
    end

    def modifyIndex index, decodeLyricWithRuby
      logger.info(" ================= ")
      logger.info("index = #{index}")
      logger.info("decodeLyricWithRuby = #{decodeLyricWithRuby}")
      logger.info(" ================= ")

      count = 0
      while((count_next = decodeLyricWithRuby[0,index+1].count(' ')) > count) do
        count = count_next
        index += count
        logger.info("index = #{index}")
      end

      index
    end
end
