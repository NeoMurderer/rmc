Rails.application.routes.draw do
  root 'dashboard#index'
  resource :session, only: [:create, :destroy, :new] do
  	get :callback
  end

  post :fire, to: 'events#fire'
  get :tracks, to: 'vk#tracks'
  get :callback, to: 'dashboard#callback'
  get :friends, to: 'friends#find'
end
