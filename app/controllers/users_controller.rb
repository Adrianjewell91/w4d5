class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url, method: :get
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render Plain: 'User not FOUND!!!!AAAHAAHAHAHAHAHA'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
