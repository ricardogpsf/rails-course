Rails.application.routes.draw do
  resources :printers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'application#login'

  get '/organizations', to: 'organizations#index'
  post '/organizations', to: 'organizations#create'
end
