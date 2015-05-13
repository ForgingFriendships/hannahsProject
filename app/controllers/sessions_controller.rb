class SessionsController < ApplicationController
  include SessionsHelper
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :block_page_if_not_signed_in, :block_page_if_not_admin
  #skip_before_filter :set_current_user
  def new
    #render login form
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth
      user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
        User.create_with_omniauth(auth)
      log_in user
      #session[:uid] = user.uid
      #redirect_to root_path
      go_home
      flash_login
    else
      user = User.find_by_email(params[:session][:email].downcase)

      if :provider.nil? && user.authenticate(params[:session][:password].downcase)
        log_in user
        #session[:uid] = user.uid
        #redirect_to root_path
        go_home
        flash_login
      else
        flash[:notice] = "Could not log in!"
        render "new"
      end
    end
  end


  def destroy
    session.delete(:user_id)
    flash_logout
    go_home
  end

end
