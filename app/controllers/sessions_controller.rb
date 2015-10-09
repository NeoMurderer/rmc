class SessionsController < ApplicationController
  def create
    @user_session = UserSession.new user_session_params
    authorize! :create, @user_session
    if @user_session.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    authorize! :destroy, UserSession
  end

  def new
      @user_session = UserSession.new
      authorize! :create, @user_session
  end
 
  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
