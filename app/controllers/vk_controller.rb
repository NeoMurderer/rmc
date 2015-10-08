class VkController < ActionController::Base
	require 'vkontakte_api'
	def find
   		@vk = VkontakteApi::Client.new(session[:vk_token])
		@current_user = @vk.users.get()
		@result = @vk.audio.get(owner_id:'67297789',limit:10)	
	end
end
