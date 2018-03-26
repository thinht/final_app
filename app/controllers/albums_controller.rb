class AlbumsController < ApplicationController

  before_action :get_album, only: [:show, :edit, :update, :destroy]
  before_action :get_user, only: [:index, :create]

  def index
    @albums = @user.albums.page(params[:page]).per(10)
  end

  def new
    @album = Album.new
  end

  def show

  end

  def edit

  end

  def create
    @album = @user.albums.create(album_params)
    redirect_to user_albums_path(@user)
  end

  def destroy
    @user = @album.user
    @album.destroy
    redirect_to user_albums_path(@user)
  end

  def update
    @user = @album.user
    @album.update(album_params)
    redirect_to user_albums_path(@user)
  end

  private
    def album_params
      params.require(:album).permit(:title,:desc,:is_public,:image)
    end

    def get_album
      @album = Album.find(params[:id])
    end

    def get_user
      @user = User.find params[:user_id]
    end

end
