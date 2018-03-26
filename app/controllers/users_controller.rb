class UsersController < ApplicationController
   # POST /users
  # POST /users.json
  # paginates_per 2
  before_action :get_user, only: [:show, :edit, :update]

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email.deliver_lateR

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def dashboard
    @pictures = current_user.pictures
  end

  def index
    # @users = User.all#find params[:id]
    @users = User.page(params[:page]).per(2)
  end

  def show

  end

  def edit

  end

  def update
    @user.update(user_params)
    redirect_to users_path
    UserMailer.welcome_email.deliver_now
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

    def get_user
      @user = User.find params[:id]
    end
end
