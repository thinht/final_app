class HomeController < ApplicationController
  def index
    @albums = Album.includes(:pictures)
  end
end
