class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  #sets the current session token to the
  def current_user
    # fail 
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = @user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  #Next things: write the log in and log out refactoring.

  #write the current user method: sets session token.

  #add the log out button to the show method for log out functionality.

  #redirect to sign up unless logged in, add a buton on login to sign_up.

  #Inside the site, where can anyone go, and where can only logged in people go?
end
