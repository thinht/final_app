class PicturesController < ApplicationController
  def index

    # @user = User.find params[:user_id]
    # @album = @user.
    if params[:album_id] &&  @album = Album.find(params[:album_id])
      @pictures = @album.pictures.page(params[:page]).per(1)
    else
      @pictures = Picture.page(params[:page]).per(1)
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.new
  end

  def edit
    # @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
  end

  def create
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.create(picture_params)
    redirect_to album_pictures_path(@album)
  end

  def destroy
    # @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
    @album = @picture.album
    @picture.destroy
    redirect_to album_pictures_path(@album)
  end

  def update
    # @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
    @album = @picture.album
    @picture.update(picture_params)
    redirect_to album_pictures_path(@album)
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :desc, :is_public, :image)
  end
end
