class ImagesController < ApplicationController
  def new
  end

  def index
    @query = params[:search]
    @image_array = flickr.photos.search(tags: @query, sort: 'relevance').to_a
    @results = Kaminari.paginate_array(@image_array).page(params[:page]).per(20)
  end
end
