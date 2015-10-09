class VkController < ActionController::Base
	require 'vkontakte_api'
	def find
   		@vk = VkontakteApi::Client.new(session[:vk_token])
		@current_user = @vk.users.get()
		if params[:name]
			@result = @vk.audio.search(q:params[:name],count: 300)
		else
			@result = @vk.audio.get(owner_id:'67297789')
		end
	end
end
