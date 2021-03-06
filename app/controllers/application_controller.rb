class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in? #makes it available to the view.

  def logged_in?
    current_user != nil
  end

  def current_user
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

  #DO THIS LATER:
  #redirect to sign up unless logged in, add a buton on login to sign_up.
  #Inside the site, where can anyone go, and where can only logged in people go?

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
