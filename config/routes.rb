Rails.application.routes.draw do
  root 'dashboard#index'
  resource :session, only: [:create, :destroy, :new]

  post :fire, to: 'events#fire'
end
