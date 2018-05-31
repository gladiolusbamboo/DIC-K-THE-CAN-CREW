module SearchHelper
  include Utility

  # 検索結果の部分を表示する関数
  def show_searchwords is_ruby_search, info_arr, searchword
    content_tag(:ul) do
      # info_arrはLyricモデルの配列
      info_arr.each do |info|
        lyric_with_ruby = info.lyric_with_ruby
        # {漢字,かんじ}表記から表示用文字列に戻す
        lyric_decoded = decode_lyric_with_ruby(lyric_with_ruby)

        unless(is_ruby_search)
          lyric_original = info.lyric
        else
          lyric_original = info.ruby
        end

        # 出現場所indexを格納した配列を取得する
        index_array = get_index_array(lyric_original, searchword)

        # "ルビ検索"が指定されている場合以外は表記検索をする
        unless(is_ruby_search)
          # index_arrayにはsearchwordの出現位置が格納されている
          index_array.each do |index|
            # searchwordの出現位置と直後の位置インデックスを設定
            index_modified_array = get_index_modified_array_lyric(lyric_decoded, index, searchword)
            # ひとつずつ検索結果をconcatする
            concat_result_li(index_modified_array, lyric_decoded, info)
          end
        # ルビ検索を行う場合の処理
        else
          index_array.each do |index|
            # searchwordの出現位置と直後の位置インデックスを設定
            index_modified_array = get_index_modified_array_ruby(lyric_with_ruby, index, searchword)
            # ひとつずつ検索結果をconcatする
            concat_result_li(index_modified_array, lyric_decoded, info)
          end
        end
      end
    end
  end

  # SearchLogからsearchwordの最頻出曲を得る関数
  def get_most_appear_song_name_from_search_log search_log
    max = 0
    most_appear_song_id = ''
    # 中間テーブルを走査して各曲のsearchwordの出現回数を得る
    search_log.search_log_songs.each do |search_log_song|
      if search_log_song.phrase_hit_count > max
        max = search_log_song.phrase_hit_count
        most_appear_song_id = search_log_song.song_id
      end
    end
    # もっとも出現回数が多い曲の曲名を返す
    search_log.songs.find(most_appear_song_id).name
  end

  # 検索条件からsearchwordの最頻出曲を得る処理
  def get_most_appear_song_name_from_search_condition(searchword, searchtype_sym) 
    searchtype = get_search_type(searchtype_sym);

    # 検索条件からその条件での最新の検索履歴を取得
    search_log = SearchLog.where(searchword: searchword, searchtype: searchtype)
      .order(created_at: :desc)
      .first

    get_most_appear_song_name_from_search_log(search_log)   
  end

  # ランダムでカード種を表示する
  # 1/10で背景付きカード
  # 1/10で色付きカードを表示し
  # 8/10で白いデフォルトのカードを表示する
  def generate_card_random(info_arr, seed)
    srand(seed)    
    card_index =  rand(10)
    case card_index
    when 0 then
      # 背景画像付きカード
      generate_card_with_background_image(info_arr)
    when 1 then
      # 背景色付きカード
      generate_card_with_background_color(info_arr)
    else
      # デフォルト白カード
      generate_card_default(info_arr)
    end
  end

  private
    # {漢字,かんじ}表記から表示用文字列に戻す
    def decode_lyric_with_ruby lyric_with_ruby
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
        # なので、match[0]をmatch[1]に置き換えてやるとうまくいく
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
      index_modified_array << modify_index(index, lyric_decoded, false)
      # searchword直後の５文字をどこから切り取るかを設定
      index_modified_array << modify_index(index + searchword.length, lyric_decoded, true)
    end

    # 半角スペース分のindex位置を修正する
    # is_space_okはindex_returnの部分の文字が半角スペースでも許容するか
    def modify_index index, decodedLyricWithRuby, is_space_ok
      index_return = index
      space_count = 0
      # 新しい半角スペースが見つからなくなるまで処理を続ける
      while((next_space_count = decodedLyricWithRuby[0, index_return].count(' ')) > space_count)
        space_count = next_space_count
        # 見つかった半角スペースの分だけindex位置を修正する
        index_return = index + space_count
      end

      # index_return位置の文字が半角スペースを許容するか
      # 許容しない場合１文字ずつずらして半角スペースじゃない場所を探す
      if !is_space_ok
        # decodedLyricWithRuby.length = 10 であれば
        # index_return[9]は走査する必要がない
        while(decodedLyricWithRuby.length[index_return+1] && decodedLyricWithRuby[index_return] == ' ')
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
                  if(ch =~ /\A[\p{hiragana}\p{katakana}ー]\z/)
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

    # 検索結果を<li>タグで返す
    def concat_result_li(index_modified_array, lyric_decoded, info)
      # 検索文字列の登場位置
      index_modified = index_modified_array[0]
      # 検索文字列直後の位置
      latter_index_modified = index_modified_array[1]
      concat(
        content_tag(:li, class: 'hit-part-info') do
          # lyricの先頭付近にsearchwordがあった場合の対策
          start_index = index_modified - 5
          if start_index <= 0 
            start_index = 0
          else
            concat "…"            
          end
          length = index_modified - start_index
          
          # searchword直前の５文字切り出し
          concat lyric_decoded.slice(start_index,length)
          # searchwordを切り出して強調
          length = latter_index_modified - index_modified
          concat content_tag(:span, lyric_decoded.slice(index_modified, length), class: 'word-hit')
          # searchword直後の５文字切り出し
          concat lyric_decoded.slice(latter_index_modified, 5)
          if lyric_decoded.length - latter_index_modified > 5
            concat "…"            
          end

          concat(content_tag(:div) do
            concat "(#{info.lyric_type.name}#{info.part_lyric_order} by "
            concat content_tag(:span, info.singer.name, class: 'artist-hit')
            concat ")"
          end)
        end
      )
    end

    # 背景画像付きカード生成
    def generate_card_with_background_image(info_arr)
      # ランダムに背景画像のURLを取得する
      image_url = get_random_image_url()

      # カード部分のHTMLを表示する
      content_tag(:div, class: "card-box col-md-4 col-sm-6 animated #{get_random_animation()}") do
        content_tag(:div, class: 'card card-just-text card-with-border', 'data-background': 'image', 'data-src': image_url , style: "background-image: url('#{image_url}')", 'background-position': 'center center', 'background-size': 'cover') do
          concat(content_tag(:div, class: 'content') do

            concat_html_with_tag("p", info_arr[0].song.artist.name, "description")
            concat_html_with_tag("h4", info_arr[0].song.name, "title title-modern")

            concat_song_credit_info(info_arr[0].song)

            concat_fade_hr()

            concat_recorded_cd_info(info_arr[0].song.cds)

            concat_fade_hr()

            concat(show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word))

          end)
          concat_html_with_tag("div", '', "filter")
        end
      end
    end
   
    # 背景色付きカード生成
    def generate_card_with_background_color(info_arr)
      # ランダムに背景色を取得する
      card_color = get_random_color()

      # カード部分のHTMLを表示する
      content_tag(:div, class: "card-box col-md-4 col-sm-6 animated #{get_random_animation()}") do        
        content_tag(:div, class: 'card card-with-border', 'data-background': 'color', 'data-color': card_color) do
          concat(content_tag(:div, class: 'content') do
            concat_html_with_tag("h6", info_arr[0].song.artist.name, "category")
            concat_html_with_tag("h4", info_arr[0].song.name, "title title-modern")

            concat_song_credit_info(info_arr[0].song)

            concat_fade_hr()

            concat_recorded_cd_info(info_arr[0].song.cds)

            concat_fade_hr()

            concat(show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word))
          end)
        end
      end
    end
    
    # デフォルト白カード生成
    def generate_card_default(info_arr)
      content_tag(:div, class: "card-box col-md-4 col-sm-6 animated #{get_random_animation()}") do
        content_tag(:div, class: 'card') do
          concat(content_tag(:div, class: 'content') do

            concat_html_with_tag("h6", info_arr[0].song.artist.name, "category")
            concat_html_with_tag("h4", info_arr[0].song.name, "title")

            concat_song_credit_info(info_arr[0].song)

            concat_fade_hr()

            concat_recorded_cd_info(info_arr[0].song.cds)

            concat_fade_hr()

            concat(show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word))
          end)
        end
      end
    end

    def get_random_animation()
      animation_index =  rand(4)
      case animation_index
      when 0 then
        return 'fadeInDown'
      when 1 then
        return 'fadeInLeft'
      when 2 then
        return 'fadeInRight'
      when 3 then
        return 'fadeInUp'
      end
    end

    # ランダムにカード背景色を取得する
    def get_random_color
      card_index =  rand(3)
      case card_index
      when 0 then
        return 'orange'
      when 1 then
        return 'azure'
      when 2 then
        return 'green'
      end
      return 'orange'
    end

    # ランダムにカード背景画像URLを取得する
    def get_random_image_url
      # image_name
      image_index =  rand(8)
      case image_index
      when 0 then
        image_name = 'lifestyle-1'
      when 1 then
        image_name = 'lifestyle-2'
      when 2 then
        image_name = 'lifestyle-3'
      when 3 then
        image_name = 'lifestyle-5'
      when 4 then
        image_name = 'lifestyle-6'
      when 5 then
        image_name = 'lifestyle-7'
      when 6 then
        image_name = 'lifestyle-8'
      when 7 then
        image_name = 'lifestyle-9'
      end

      "../../assets/img/#{image_name}.jpg"
    end

    # 曲のクレジット情報をconcatする
    def concat_song_credit_info(song_info)
      concat(content_tag(:ul) do
        concat(content_tag(:li, '作詞：' + song_info.lyricist))
        concat(content_tag(:li, '作曲：' + song_info.composer))
        concat(content_tag(:li, '編曲：' + song_info.arranger))
      end)
    end
    
    # 収録されているCDの情報をconcatする
    def concat_recorded_cd_info(cds_info)
      concat(content_tag(:h5, '収録CD'))
      concat(content_tag(:ul) do
        cds_info.each do |cd|
          concat(content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')'))
        end
      end)
    end

    # classを設定したHTMLを生成してconcatする
    def concat_html_with_tag(tag_name, text, class_name)
      concat(content_tag(tag_name.to_sym, text, class: class_name))
    end

    # フェードアウトする区切り横棒を表示する
    def concat_fade_hr
      concat(tag(:hr, class: 'fade-2'))
    end
    
    

    ####################################
    # これ以降のgenerate_cardは使わない  #
    # かも                             #
    ####################################
    def generate_card_1(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card') do
          concat(
            content_tag(:div, class: 'header') do
              tag(:img, src: '../../assets/img/lifestyle-8.jpg')
            end
          )
          concat(
            content_tag(:div, class: 'content') do
              concat(
                content_tag(:h6, info_arr[0].song.artist.name, class: 'category')
              )
              concat(
                content_tag(:h4, info_arr[0].song.name, class: 'title')
              )
              concat(
                content_tag(:ul) do
                  concat(
                    content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                  )
                  concat(
                    content_tag(:li, '作曲：' + info_arr[0].song.composer)
                  )
                  concat(
                    content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                  )
                end
              )
              concat(
                tag(:hr, class: 'fade-2')
              )
              concat(
                content_tag(:h5, '収録CD')
              )
              concat(
                content_tag(:ul) do
                  info_arr[0].song.cds.each do |cd|
                    concat(
                      content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                    )
                  end
                end
              )
              concat(
                tag(:hr, class: 'fade-2')
              )
              concat(
                show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
              )
            end
          )
        end
      end
    end

    def generate_card_2(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card', 'data-background': 'image', 'data-src': '../../assets/img/lifestyle-1.jpg') do
          concat(
            content_tag(:div, class: 'header') do
              content_tag(:div, class: 'category') do
                content_tag(:h6, info_arr[0].song.artist.name, class: 'label label-danger')
              end
            end
          )
          concat(
              content_tag(:div, class: 'content') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, '', class: :filter)
          )
        end
      end
    end

    def generate_card_4(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card') do
          concat(
            content_tag(:div, class: 'header', style: "background-image: url(\"../../assets/img/beard-1.jpg\"); background-position: center center; background-size: cover;") do
              tag(:img, src: '../../assets/img/beard-1.jpg')
            end
          )
          concat(
            content_tag(:div, class: 'social-line social-line-visible', 'data-buttons': '4') do
              concat(
                content_tag(:button, class: 'btn btn-social btn-facebook') do
                  content_tag(:i, '', class:'fab fa-facebook-square fa-lg')
                end
              )
              concat(
                content_tag(:button, class: 'btn btn-social btn-twitter') do
                  content_tag(:i, '', class:'fab fa-twitter fa-lg')
                end
              )
              concat(
                content_tag(:button, class: 'btn btn-social btn-pinterest') do
                  content_tag(:i, '', class:'fab fa-pinterest fa-lg')
                end
              )
              concat(
                content_tag(:button, class: 'btn btn-social btn-google') do
                  content_tag(:i, '', class:'fab fa-google fa-lg')
                end
              )
            end
          )
          concat(
            content_tag(:div, class: 'content') do
              concat(
                content_tag(:h6, info_arr[0].song.artist.name, class: 'category')
              )
              concat(
                content_tag(:h4, info_arr[0].song.name, class: 'title')
              )
              concat(
                content_tag(:ul) do
                  concat(
                    content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                  )
                  concat(
                    content_tag(:li, '作曲：' + info_arr[0].song.composer)
                  )
                  concat(
                    content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                  )
                end
              )
              concat(
                tag(:hr, class: 'fade-2')
              )
              concat(
                content_tag(:h5, '収録CD')
              )
              concat(
                content_tag(:ul) do
                  info_arr[0].song.cds.each do |cd|
                    concat(
                      content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                    )
                  end
                end
              )
              concat(
                tag(:hr, class: 'fade-2')
              )
              concat(
                show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
              )
            end
          )
        end
      end
    end

    def generate_card_5(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card', 'data-background': 'image', 'data-src': '../../assets/img/lifestyle-2.jpg', 'background-position': 'center center', 'background-size': 'cover') do
          concat(
            content_tag(:div, class: 'header') do
              concat(
                content_tag(:div, class: 'category') do
                  content_tag(:h6, info_arr[0].song.artist.name, class: 'label label-warning')
                end
              )
              concat(
                content_tag(:div, class: 'social-line', 'data-buttons': '3') do
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-facebook') do
                      content_tag(:i, '', class:'fab fa-facebook-square')
                    end
                  )
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-twitter') do
                      content_tag(:i, '', class:'fab fa-twitter')
                    end
                  )
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-pinterest') do
                      content_tag(:i, '', class:'fab fa-pinterest')
                    end
                  )
                end
              )
            end
          )
          concat(
              content_tag(:div, class: 'content') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, '', class: :filter)
          )
        end
      end
    end

    def generate_card_6(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card', 'data-background': 'image', 'data-src': '../../assets/img/fashion-1.jpg', style: "background-image: url('../../assets/img/fashion-1.jpg')") do
          concat(
            content_tag(:div, '', class: 'header')
          )
          concat(
              content_tag(:div, class: 'content  text-center') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, class: 'footer text-center') do
              content_tag(:div, info_arr[0].song.artist.name, class: 'btn btn-danger btn-fill btn-round')
            end
          )
          concat(
            content_tag(:div, '', class: :filter)
          )
        end
      end
    end

    def generate_card_8(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card card-with-border', 'data-background': 'color', 'data-color': 'azure') do
          concat(
            content_tag(:div, class: 'header') do
              content_tag(:div, class: 'icon') do
                content_tag(:i, '', class: 'pe-7s-radio')
              end
            end
          )
          concat(
              content_tag(:div, class: 'content  text-center') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title title-modern')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, class: 'footer text-center') do
              content_tag(:button, info_arr[0].song.artist.name, class: 'btn btn-neutral btn-round btn-fill btn-modern')
            end
          )
        end
      end
    end

    def generate_card_10(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card text-center', 'data-background': 'image', 'data-src': '../../assets/img/city-2.png', style: "background-image: url('../../assets/img/city-2.png')", 'background-position': 'center center', 'background-size': 'cover') do
          concat(
            content_tag(:h4, info_arr[0].song.name, class: 'title title-modern')
          )
          concat(
              content_tag(:div, class: 'content  text-center') do
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, '', class: :filter)
          )
          concat(
            content_tag(:div, class: 'footer text-center') do
              content_tag(:button, info_arr[0].song.artist.name, class: 'btn btn-neutral btn-round btn-fill btn-modern')
            end
          )
        end
      end
    end

    def generate_card_11(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card card-with-border') do
          concat(
            content_tag(:div, class: 'header') do
              content_tag(:div, class: 'icon') do
                content_tag(:i, '', class: 'pe-7s-glasses')
              end
            end
          )
          concat(
              content_tag(:div, class: 'content text-center') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title title-center')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, class: 'footer btn-center') do
              content_tag(:button, info_arr[0].song.artist.name, class: 'btn btn-default btn-round btn-fill btn-info btn-modern')
            end
          )
        end
      end
    end

    def generate_card_12(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card card-just-text card-with-border', 'data-background': 'image', 'data-src': '../../assets/img/music-3.jpg', style: "background-image: url('../../assets/img/music-3.jpg')", 'background-position': 'center center', 'background-size': 'cover') do
          concat(
              content_tag(:div, class: 'content') do
                concat(
                  content_tag(:div, '', class: 'filter filter-red')
                )
                concat(
                  content_tag(:h6, info_arr[0].song.artist.name, class: 'category')
                )
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title title-modern')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, '', class: :filter)
          )
        end
      end
    end

    def generate_card_13(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card card-with-border', 'data-background': 'color', 'data-color': 'green') do
          concat(
            content_tag(:div, class: 'header') do
              concat(
                content_tag(:div, class: 'icon') do
                  content_tag(:i, '', class: 'pe-7s-gift')
                end
              )
              concat(
                content_tag(:div, class: 'social-line', 'data-buttons': '3') do
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-facebook') do
                      content_tag(:i, '', class:'fab fa-facebook-square fa-lg')
                    end
                  )
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-twitter') do
                      content_tag(:i, '', class:'fab fa-twitter fa-lg')
                    end
                  )
                  concat(
                    content_tag(:button, class: 'btn btn-social btn-pinterest') do
                      content_tag(:i, '', class:'fab fa-pinterest fa-lg')
                    end
                  )
                end
              )
            end
          )

          concat(
              content_tag(:div, class: 'content text-center') do
                concat(
                  content_tag(:h4, info_arr[0].song.name, class: 'title title-modern')
                )
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, class: 'footer text-center') do
              content_tag(:button, info_arr[0].song.artist.name, class: 'btn btn-neutral btn-fill btn-modern')
            end
          )
        end
      end
    end

    def generate_card_14(info_arr)
      content_tag(:div, class: 'card-box col-md-4 col-sm-6') do
        content_tag(:div, class: 'card text-center', 'data-background': 'image', 'data-src': '../../assets/img/city-1.jpg', style: "background-image: url('../../assets/img/city-1.jpg')", 'background-position': 'center center', 'background-size': 'cover' ) do
          concat(
            content_tag(:div, class: 'header') do
              concat(
                content_tag(:h4, info_arr[0].song.name, class: 'title title-modern')
              )
              concat(
                content_tag(:div, class: 'icon') do
                  content_tag(:i, '', class: 'pe-7s-gift')
                end
              )
            end
          )

          concat(
              content_tag(:div, class: 'content') do
                concat(
                  content_tag(:ul) do
                    concat(
                      content_tag(:li, '作詞：' + info_arr[0].song.lyricist)
                    )
                    concat(
                      content_tag(:li, '作曲：' + info_arr[0].song.composer)
                    )
                    concat(
                      content_tag(:li, '編曲：' + info_arr[0].song.arranger)
                    )
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  content_tag(:h5, '収録CD')
                )
                concat(
                  content_tag(:ul) do
                    info_arr[0].song.cds.each do |cd|
                      concat(
                        content_tag(:li, cd.name + ' (' + cd.released_at.to_s + ')')
                      )
                    end
                  end
                )
                concat(
                  tag(:hr, class: 'fade-2')
                )
                concat(
                  show_searchwords(params[:ruby_search], info_arr, @trimmed_search_word)
                )
              end
          )
          concat(
            content_tag(:div, class: 'footer text-center') do
              content_tag(:button, info_arr[0].song.artist.name, class: 'btn btn-neutral btn-round btn-modern')
            end
          )
          concat(
            content_tag(:div, '', class: 'filter filter-blue')
          )
        end
      end
    end
  end
