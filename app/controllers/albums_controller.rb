class AlbumsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @albums = @user.albums.page(params[:page]).per(2)
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create

    @user = User.find params[:user_id]
    @album = @user.albums.create(album_params)
    redirect_to user_albums_path(@user)
  end

  def destroy

    @album = Album.find(params[:id])
    @user = @album.user
    @album.destroy
    redirect_to user_albums_path(@user)
  end

  def update
    # @user = User.find params[:user_id]
    @album = Album.find(params[:id])
    @user = @album.user
    @album.update(album_params)
    redirect_to user_albums_path(@user)
  end

  private
    def album_params
      params.require(:album).permit(:title,:desc,:is_public,:image)
    end

end
