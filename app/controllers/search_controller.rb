class SearchController < ApplicationController
  def index
    @lyrics = Lyric.where("lyric like '%夕陽%'")
  end

  def result
    @lyrics = Lyric.where("lyric like '%#{params[:keywd]}%'")
  end
end
