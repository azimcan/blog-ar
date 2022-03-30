class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?, :username_controller

  def login(user_id)
    session[:user_id] = user_id
  end

  def current_user
    # @current_user nil veya false değerdeyse User.find(session[:user_id]) değerini alacaktır.
    @current_user = if session[:user_id]
                      User.find(session[:user_id])
                    else
                      'Anonymous'
                    end
  end

  def signed_in?
    current_user == 'Anonymous' ? nil : current_user
  end

  def allowed?
    redirect_to root_path, notice: 'You are not authorized to do this.' unless signed_in?
  end
end
