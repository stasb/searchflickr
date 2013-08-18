class ImagesController < ApplicationController
  def new
  end

  def index
    @query = params[:search]
    if @query.empty?
      @image_array = flickr.photos.getRecent.to_a
    else
      @image_array = flickr.photos.search(tags: @query, sort: 'relevance').to_a
    end
    @results = Kaminari.paginate_array(@image_array).page(params[:page]).per(20)
  end
end
