class ImagesController < ApplicationController
  def new
  end

  def index
    @query = params[:search]
    @results = flickr.photos.search(tags: @query, per_page: '20', page: '1')
  end
end
