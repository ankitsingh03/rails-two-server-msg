Rails.application.routes.draw do
  devise_for :users
  get 'message/index'
  post '/create', to: "message#create"
  get '/message', to: "message#message"
  get '/about', to: "message#about"
  root 'message#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
