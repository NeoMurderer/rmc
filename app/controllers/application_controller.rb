class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_session, :current_user

  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_session_path
  end

  private

  def current_session
    @current_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_session.try :user
  end
end
