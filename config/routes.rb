Rails.application.routes.draw do
  root 'dashboard#index'
  resource :session, only: [:create, :destroy, :new] do
  	get :callback
  end

  post :fire, to: 'events#fire'
  get :find, to: 'vk#find'
end
