Rails.application.routes.draw do
  get 'authentication/none'
  get 'authentication/signature'
  get 'authentication/weak'
  get 'authentication/hmac'
  get 'authentication/rce'
  get 'authentication/kid'
  get 'authentication/random'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/challenges', to: 'static_pages#challenges'
  get '/register', to: 'static_pages#register'
  resources :users
  root 'static_pages#home'

  post '/authentication/none', to: 'authentication#authnone'
  post '/authentication/hmac', to: 'authentication#authhmac'
  post '/authentication/signature', to: 'authentication#authsig'
  post '/authentication/weak', to: 'authentication#authweak'
  post '/authentication/kid', to: 'authentication#authkid'
end
