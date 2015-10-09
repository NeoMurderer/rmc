class DashboardController < ApplicationController
  def index
    authorize! :read, :dashboard
    gon.token = current_user.single_access_token
    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :audio, :notify], state: session[:state])

  end
   def callback
    authorize! :read, :dashboard
    # проверка state
    puts YAML::dump(params[:code].nil?)
    if params[:code].nil?
    	redirect_to root_path
    else
    	 # получение токена
	    @vk = VkontakteApi.authorize(code: params[:code])
	    # и сохранение его в сессии
	    session[:vk_token] = @vk.token
	    # также сохраним id пользователя на ВКонтакте - он тоже пригодится
	    session[:vk_id] = @vk.user_id
	    
	    redirect_to root_path
    end
   
  end
end
