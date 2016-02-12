class FriendsController < ActionController::Base
  require 'vkontakte_api'
  def find
    @vk = VkontakteApi::Client.new(session[:vk_token])
    @current_user = @vk.users.get()
		@result = @vk.friends.get(fields: [:uid, :first_name, :screen_name, :last_name])
  end
end
