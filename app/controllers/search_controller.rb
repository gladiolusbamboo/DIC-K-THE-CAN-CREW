class SearchController < ApplicationController
  def index
    @title = Song.all
  end
end
