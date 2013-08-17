class ImagesController < ApplicationController
  def new
  end

  def index
    @results = flickr.photos.search(tags: params[:search], per_page: '10', page: '1')
  end
end
