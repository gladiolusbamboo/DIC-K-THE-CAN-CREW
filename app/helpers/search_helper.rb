module SearchHelper
  def show_searchwords searchtype, info_arr, searchword
    content_tag(:ul) do
      # info_arrはLyricモデルの配列
      info_arr.each do |info|
        lyric_with_ruby = info.lyric_with_ruby
        # {漢字,かんじ}表記から表示用文字列に戻す
        lyric_decoded = decodeLyricWithRuby(lyric_with_ruby)

        if(searchtype != 'ルビ検索')
          lyric_original = info.lyric
        else
          lyric_original = info.ruby
        end

        # 出現場所indexを格納した配列
        index_array = get_index_array(lyric_original, searchword)

        # "ルビ検索"が指定されている場合以外は表記検索をする
        unless(searchtype == 'ルビ検索')
          # index_arrayにはsearchwordの出現位置が格納されている
          index_array.each do |index|
            # searchwordの出現位置と直後の位置インデックスを設定
            index_modified_array = get_index_modified_array_lyric(lyric_decoded, index, searchword)
            # ひとつの検索結果を表示
            concat_result_li(index_modified_array, lyric_decoded, info)
          end
        # ルビ検索を行う場合の処理
        else
          index_array.each do |index|
            # searchwordの出現位置と直後の位置インデックスを設定
            index_modified_array = get_index_modified_array_ruby(lyric_with_ruby, index, searchword)
            # ひとつの検索結果を表示
            concat_result_li(index_modified_array, lyric_decoded, info)
          end
        end
      end
    end
  end

  private
    # {漢字,かんじ}表記から表示用文字列に戻す
    def decodeLyricWithRuby lyric_with_ruby
      regex = /\\{(.*?),(.*?)\\}/
      # match結果を格納する配列
      matches = []

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
        # 同じ漢字に別のルビがあっても正しく動く
        lyric_return.gsub!(match[0], match[1])
      end

      # トリムしてreturnする
      lyric_return.strip!
    end

    # seachwordの出現場所と直後の文字の開始位置を配列として取得する
    def get_index_modified_array_lyric(lyric_decoded, index, searchword)
      index_modified_array = []
      # 半角スペース分index位置をずらす
      index_modified_array << modifyIndex(index, lyric_decoded, false)
      # searchword直後の５文字をどこから切り取るかを設定
      index_modified_array << modifyIndex(index+searchword.length, lyric_decoded, true)
    end

    # 半角スペース分のindex位置を修正する
    # is_space_okはindex_returnの部分の文字が半角スペースでも許容するか
    def modifyIndex index, decodedLyricWithRuby, is_space_ok
      index_return = index
      pp "decodedLyricWithRuby = #{decodedLyricWithRuby}"
      pp "index_return = #{index_return}"
      space_count = 0
      # 新しい半角スペースが見つからなくなるまで処理を続ける
      while((next_space_count = decodedLyricWithRuby[0, index_return].count(' ')) > space_count)
        space_count = next_space_count
        # 見つかった半角スペースの分だけindex位置を修正する
        index_return = index + space_count
      end
      pp "index_return = #{index_return}"

      # index_return位置の文字が半角スペースを許容するか
      # 許容しない場合１文字ずつずらして半角スペースじゃない場所を探す
      if !is_space_ok
        while(decodedLyricWithRuby[index_return] == ' ')
          index_return += 1
        end
      end

      index_return
    end

    # seachword（ルビ）の出現場所と直後の文字の開始位置を配列として取得する
    def get_index_modified_array_ruby lyric_with_ruby, index, searchword
      # ふりがなの文字数の配列を得る
      lyric_length_array = convert_lyric_to_length_array(lyric_with_ruby)

      # searchword(ルビ)の終了直後の文字の開始位置
      index_end = index + searchword.length

      index_modified_array = []

      # length_sumに文字数を数えていく
      length_sum = 0

      # length_sumと検索対象indexの位置関係
      state = -1

      lyric_length_array.each_with_index do |length, i|
        # length_sumがindex_endを超えた状態でふりがなが１文字以上の文字を見つければ終了
        if state == 1 && length > 0
          index_modified_array << i
          break
        end

        length_sum += length

        # 初めてlength_sumがindexを超えた箇所が表示開始位置
        if length_sum > index && index_modified_array.length == 0
          index_modified_array << i
        end

        # length_sumがindex_endと等しくなったらフラグをたてる
        if length_sum == index_end && index_modified_array.length == 1
          state = 0
        end

        if length_sum > index_end && index_modified_array.length == 1
          # length_sumとindex_endと等しくなる場所があれば、
          # length_sumがindex_endを超えた位置が終了直後の文字の開始位置になる
          if state == 0
            index_modified_array << i
            break
          # length_sumとindex_endと等しくなる場所がなければ、フラグを立てて
          # 次にふりがなが０文字でない位置を探す
          else
            state = 1
          end
        end
      end

      # 終了位置が見つからなかった場合は、lyric_length_arrayの配列長+1を
      # 終了直後の文字の開始位置とする
      if index_modified_array.length < 2
        index_modified_array << lyric_length_array.length+1
      end

      index_modified_array
    end

    # ふりがなの文字数の配列を得る
    def convert_lyric_to_length_array(lyric_with_ruby)
      lyric_length_array = []

      # "{漢字,かんじ}とひらがな…"みたいな形式に文字列を変換する
      lyric_with_ruby_clone = lyric_with_ruby.clone
      lyric_with_ruby_clone.gsub!('\{','{')
      lyric_with_ruby_clone.gsub!('\}','}')

      # 括弧内を走査している時のフラグ
      is_inner_parenthesis = false
      # 括弧内のカンマ以降を走査している時のフラグ
      is_pass_separator = false

      display_characters = ""
      ruby_characters = ""

      lyric_with_ruby_clone.chars do |character|
        # 括弧外処理
        unless is_inner_parenthesis
          if character == '{'
            is_inner_parenthesis = true
          else
            lyric_length_array << 1
          end
        # 括弧内処理
        else
          # 括弧内カンマ前処理
          unless is_pass_separator
            if character == ','
              is_pass_separator = true
            else
              # 文字を連結して表示用文字列を作成しておく
              display_characters << character
            end
          # 括弧内カンマ後処理
          else
            # 括弧終了時点でふりがなの文字数を割り振る処理を行う
            if character == '}'
              index_tmp = 0
              # 表示用文字列がすべてカタカナであれば
              if display_characters =~ /\A[\p{katakana}ー]+\z/
                # 各文字にふりがな文字数１をセットする
                display_characters.chars do |display_character|
                  lyric_length_array << 1
                end
              else
                # 送り仮名の処理
                # Ex.「届ける」の場合
                ruby_length = ruby_characters.length
                ruby_length_array = []
                # 一旦、頭文字にすべての文字数を与える
                # Ex.届ける　display_characters => [3,0,0]
                display_characters.chars do |display_character|
                  if index_tmp == 0
                    ruby_length_array << ruby_length
                  else
                    ruby_length_array << 0
                  end
                  index_tmp += 1
                end

                # 文字列を逆順に走査して送り仮名を判定する
                display_characters.length.times{|n|
                  ch = display_characters[display_characters.length-1-n]
                  # 走査対象の文字列がひらがな、もしくはカタカナであれば
                  if(ch =~ /\A[\p{hiragana}\p{katakana}]ー\z/)
                    # 頭文字に与えたふりがな文字数を１減らして、
                    ruby_length_array[0] -= 1
                    # 走査対象文字のふりがな文字数に移動する
                    ruby_length_array[display_characters.length-1-n] = 1
                  else 
                    # ひらがなかカタカナでない文字を発見したら終了
                    break
                  end
                }

                # 完成した配列を元の配列に結合する
                lyric_length_array.concat(ruby_length_array)
              end

              is_inner_parenthesis = false
              is_pass_separator = false
              display_characters = ''
              ruby_characters = ''
            else
              # 文字を連結してルビ用文字列を作成しておく
              ruby_characters << character
            end
          end
        end
      end
      lyric_length_array
    end

    def get_index_array(lyric_original, searchword)
      index_array = []
      # 正規表現だとマッチングが重なる部分が
      # うまくいかないのでindex()を使う
      offset = 0
      while (index = lyric_original.index(searchword, offset)) do
        index_array << index
        offset = index + 1
      end
      index_array
    end

    # 検索結果を<li>タグで返す
    def concat_result_li(index_modified_array, lyric_decoded, info)
      # 検索文字列の登場位置
      index_modified = index_modified_array[0]
      # 検索文字列直後の位置
      latter_index_modified = index_modified_array[1]
      concat(
        content_tag(:li) do
          # lyricの先頭付近にsearchwordがあった場合の対策
          start_index = index_modified - 5
          if start_index < 0 
            start_index = 0
          end
          length = index_modified - start_index
          
          # searchword直前の５文字切り出し
          concat lyric_decoded.slice(start_index,length)
          # searchwordを切り出して強調
          length = latter_index_modified - index_modified
          concat content_tag(:b, lyric_decoded.slice(index_modified, length), style: 'color:red')
          # searchword直後の５文字切り出し
          concat lyric_decoded.slice(latter_index_modified, 5)
          concat "　(#{info.lyric_type.name}#{info.part_lyric_order} by "
          concat content_tag(:b, info.singer.name, style: 'color:green')
          concat ")"
        end
      )
    end
end
