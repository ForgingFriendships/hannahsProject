class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user, :block_page_if_not_signed_in
  helper_method :logged_in_using_omniauth?
  protected # prevents method from being invoked by a route
  def set_current_user
    # We exploit the fact that find_by_id(nil) returns nil
    # Also because "||=" used, if @current_user already has value in it,
    # won't be written over
    @current_user ||= User.find_by_id(session[:user_id])
  end


  protected # I'm copying this keyword from above... does it work here? - Greg
  def block_page_if_not_signed_in
    # NOTE THIS ONLY STOPS NOT-LOGGED PEOPLE, ANYONE CAN REGISTER AND
    # LOG IN AND SEE THE PAGES THIS IS APPLIED TO, NOT JUST ADMINS
    redirect_to login_path and return unless @current_user
  end

  #purpose: to maintain a session to check if it's logged in through omniauth
  #also modified sessions_controller to contain checkLogin method
  #remember line 5 helper_method :logged_in_using_omniauth?
  #http://stackoverflow.com/questions/15955139/how-to-check-if-current-user-is-logged-in-through-omniauth
  def logged_in_using_omniauth?
    session[:logged_in_using_omniauth].present?
  end

end
