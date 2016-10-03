Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: [:new, :index, :create]
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/loginn', to: 'users#loginn'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
