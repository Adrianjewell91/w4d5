class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user
      #what happens here? Log in, then redirect to show.
      login!(@user)
      # fail
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Wrong Credentials"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

end
