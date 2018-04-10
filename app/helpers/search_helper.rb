module SearchHelper
  def extract_search_word word, lyric
    reg = /(.{0,5}#{word}.{0,5})/
    matched = reg.match(lyric)
    if matched
      matched[0]
    else
      ""
    end
  end

  def show_searchwords_in_lyric info_arr, searchword
    "show_searchwords_in_lyric"
    reg = /(#{searchword})/
    content_tag(:ul) do
      info_arr.each do |info|
        index_arr = []
        lyric_tmp = info.lyric

        while (index = lyric_tmp =~ reg) do
          pp "lyric_tmp = #{lyric_tmp}"
          if index_arr.length == 0
            pp'IUIU'
            index_arr << index
          else
            pp'ABAB'
            index += index_arr[-1] + searchword.length
            index_arr << index
          end
          lyric_tmp = lyric_tmp.slice!(index+searchword.length..-1)
          pp "lyric_tmp = #{lyric_tmp}"
        end
        pp "index_arr = #{index_arr}"


        pp "index = #{index}"

        matched = info.lyric.scan(reg)
        pp "MATCHED = " + matched.to_s
        matched.each do |mtc|
          concat(
            content_tag(:li) do
              concat mtc[0]
              concat content_tag(:b, mtc[1])
              concat mtc[2]
            end
          )
        end
      end
    end
    # <% info_arr.each do |info| %>
    #   <li><%= highlight(extract_search_word(params['searchword'], info.lyric), params['searchword']) %>(<%= info.lyric_type.name %><%= info.lyric_order %> by <%= info.singer.name %>)</li>
    # <% end %>

  end
end
