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

    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :audio, :notify], state: session[:state])
  end

  def callback
    # проверка state
    authorize! :create, UserSession

    if session[:state].present? && session[:state] != params[:state]
      redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end
    
    # получение токена
    @vk = VkontakteApi.authorize(code: params[:code])
    # и сохранение его в сессии
    session[:vk_token] = @vk.token
    # также сохраним id пользователя на ВКонтакте - он тоже пригодится
    session[:vk_id] = @vk.user_id
    
    redirect_to root_url
  end
  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
