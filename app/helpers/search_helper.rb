module SearchHelper
  def show_searchwords searchtype, info_arr, searchword
    content_tag(:ul) do
      # info_arrはLyricモデルの配列
      info_arr.each do |info|
        lyric_with_ruby = info.lyric_with_ruby
        # {漢字,かんじ}表記から表示用文字列に戻す
        lyric_decoded = decodeLyricWithRuby(:Lyric, lyric_with_ruby)

        if(searchtype != 'ルビ検索')
          lyric_original = info.lyric
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

        if(searchtype != 'ルビ検索')
          # index_arrにはsearchwordの出現位置が格納されている
          index_arr.each do |index|
            # pp "index = #{index}"
            # 半角スペース分index位置をずらす
            index_modified = modifyIndex(index, lyric_decoded, false)
            # pp "index+searchword.length = #{index+searchword.length}"
            # searchword直後の５文字をどこから切り取るかを設定
            latter_index_modified = modifyIndex(index+searchword.length, lyric_decoded, true)
            # pp "latter_index_modified = #{latter_index_modified}"
            # pp "lyric_original = #{lyric_original}"
            # logger.info "lyric_original = #{lyric_original}"
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
                length = latter_index_modified - index_modified
                concat content_tag(:b, lyric_decoded.slice(index_modified, length))
                # searchword直後の５文字切り出し
                concat lyric_decoded.slice(latter_index_modified, 5)
                concat "(#{info.lyric_type.name}#{info.part_lyric_order} by #{info.singer.name})"
              end
            )
          end
        else
          logger.info 'RUBY'
          # index_arrにはsearchwordの出現位置が格納されている
          index_arr.each do |index|
            index_modified_array = get_index_modified_array(lyric_with_ruby, index, searchword)
            index_modified = index_modified_array[0]
            latter_index_modified = index_modified_array[1]

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
                length = latter_index_modified - index_modified
                concat content_tag(:b, lyric_decoded.slice(index_modified, length))
                # searchword直後の５文字切り出し
                concat lyric_decoded.slice(latter_index_modified, 5)
                concat "(#{info.lyric_type.name}#{info.part_lyric_order} by #{info.singer.name})"
              end
            )
          end

        end
      end
    end
  end

  private
    # {漢字,かんじ}表記から表示用文字列に戻す
    def decodeLyricWithRuby type, lyric_with_ruby
      # pp "type = #{type}"
      regex = /\\{(.*?),(.*?)\\}/
      # match結果を格納する配列
      matches = []
      # 漢字混じり表記に戻す
      if type == :Lyric
        # logger.info "lyric_with_ruby = #{lyric_with_ruby}"
        
        lyric_tmp = lyric_with_ruby.clone
        lyric_return = lyric_with_ruby.clone

        # マッチしなくなるまで繰り返す
        while (match = regex.match(lyric_tmp)) do
          matches << match
          # ＄’でマッチ部以降の文字列が取得できるらしい
          lyric_tmp = $'
          # match[0]:{漢字,かんじ}
          # match[1]:漢字
          # match[2]:かんじ
          # なので、match[0]をmatch[1]に置き換えてやる
          # 同じ感じに別のルビがあっても正しく動く
          lyric_return.gsub!(match[0],match[1])
        end

        # トリムしてreturnする
        lyric_return.strip!
      end
    end

    # 半角スペース分のindex位置を修正する
    # is_space_okはindex_returnの部分の文字が半角スペースでも許容するか
    def modifyIndex index, decodeLyricWithRuby, is_space_ok
      index_return = index
      space_count = 0
      # 新しい半角スペースが見つからなくなるまで処理を続ける
      while((next_space_count = decodeLyricWithRuby[0, index_return].count(' ')) > space_count)
        space_count = next_space_count
        index_return = index + space_count
      end

      # index_return位置の文字が半角スペースを許容するか
      # 許容しない場合１文字ずつずらして半角スペースじゃない場所を探す
      if !is_space_ok
        # logger.info('space check')
        # logger.info(decodeLyricWithRuby[index_return])          
        while(decodeLyricWithRuby[index_return] == ' ')
          index_return += 1
        end
      end

      # logger.info("index = #{index}")
      # logger.info("space_sum = #{space_count}")
      # logger.info("index_return = #{index_return}")

      index_return
    end

    def get_index_modified_array lyric_with_ruby, index, searchword
      logger.info("lyric_with_ruby = #{lyric_with_ruby}")
      lyric_length_array = convert_lyric_to_length_array(lyric_with_ruby)
      logger.info("lyric_length_array = #{lyric_length_array}")

      logger.info("index = #{index}")
      logger.info("searchword = #{searchword}")

      index_end = index + searchword.length
      logger.info("index_end = #{index_end}")

      index_modified_array = []

      length_sum = 0
      is_over = false
      state = -1
      lyric_length_array.each_with_index do |length, i|
        logger.info "====NEXT===="
        logger.info "i = #{i}" 
        if state == 1 && length > 0
          logger.info "end_index設定 = #{i}" 
          index_modified_array << i
          break
        end
        length_sum += length
        logger.info "length_sum = #{length_sum}" 
        logger.info "index_end = #{index_end}" 
        if length_sum > index && index_modified_array.length == 0
          logger.info "start_index設定 = #{i}" 
          index_modified_array << i
        end
        if length_sum == index_end && index_modified_array.length == 1
          state = 0
          logger.info "ぴったりになったよ"
        end
        if length_sum > index_end && index_modified_array.length == 1
          if state == 0
            logger.info "end_index設定 = #{i}" 
            index_modified_array << i
            break
          else
            state = 1
            logger.info "いきなりこえたよ"
          end
        end
      end
      if index_modified_array.length < 2
        index_modified_array << lyric_length_array.length+1
      end

      logger.info("index_modified_array = #{index_modified_array}")

      index_modified_array

    end

    def convert_lyric_to_length_array(lyric_with_ruby)
      lyric_length_array = []
      # logger.info "文字列長配列に変換"
      lyric_with_ruby_clone = lyric_with_ruby.clone
      lyric_with_ruby_clone.gsub!('\{','{')
      lyric_with_ruby_clone.gsub!('\}','}')

      is_inner_parenthesis = false
      is_pass_separator = false

      display_characters = ""
      ruby_characters = ""

      lyric_with_ruby_clone.chars do |character|
        logger.info character
        if !is_inner_parenthesis
          if character == '{'
            # logger.info '括弧に入ったよ'
            is_inner_parenthesis = true
          else
            # logger.info '平がな発見'
            lyric_length_array << 1
          end
        else
          if !is_pass_separator
            if character == ','
              # logger.info 'カンマを見つけたよ'
              is_pass_separator = true
            else
              display_characters << character
              # logger.info "display_characters = #{display_characters}"
            end
          else
            if character == '}'
              # logger.info '括弧が終わったよ'
              index_tmp = 0

              if display_characters =~ /\A[\p{katakana}]+\z/
                display_characters.chars do |display_character|
                  lyric_length_array << 1
                end
              else
                display_characters.chars do |display_character|
                  if index_tmp == 0
                    lyric_length_array << ruby_characters.length
                  else
                    lyric_length_array << 0
                  end
                  index_tmp += 1
                end
              end

              is_inner_parenthesis = false
              is_pass_separator = false
              display_characters = ''
              ruby_characters = ''

              # logger.info "（括弧終了）display_characters = #{display_characters}"
              # logger.info "（括弧終了）ruby_characters = #{ruby_characters}"
              # logger.info "（括弧終了）lyric_length_array = #{lyric_length_array}"
            else
              ruby_characters << character
              # logger.info "ruby_characters = #{ruby_characters}"
            end
          end
        end
      end
      lyric_length_array
    end
end
