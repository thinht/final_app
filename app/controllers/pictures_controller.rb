class PicturesController < ApplicationController

  before_action :get_picture, only: [:edit, :update, :destroy]
  before_action :get_album, only: [:new, :create]

  def index
    if params[:album_id] &&  get_album)
      @pictures = @album.pictures.page(params[:page]).per(1)
    else
      @pictures = Picture.page(params[:page]).per(1)
    end
  end

  def new
    @picture = @album.pictures.new
  end

  def edit

  end

  def create
    @picture = @album.pictures.create(picture_params)
    redirect_to album_pictures_path(@album)
  end

  def destroy
    @album = @picture.album
    @picture.destroy
    redirect_to album_pictures_path(@album)
  end

  def update
    @album = @picture.album
    @picture.update(picture_params)
    redirect_to album_pictures_path(@album)
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :desc, :is_public, :image)
  end

  def get_picture
    @picture = Picture.find(params[:id])
  end

  def get_album
    @album = Album.find(params[:album_id])
  end

end
