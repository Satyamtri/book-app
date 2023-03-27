require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :books
  resources :admins
  root to: 'pages#home'
  resources :pages
  resources :categories
  resources :lineitems
  resources :orders
  resources :webhooks, only: [:create]
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users

  get '/checkout/success', to: "checkout#success"
  get '/checkout/cancel', to: "checkout#cancel"
  post 'checkout/create', to: "checkout#create"
  post 'checkout/create_book', to: "checkout#create_book"


  post '/addtocart', to: "orders#add_to_cart"
  get '/cart', to: "orders#cart"
  

  post 'addaddress', to: "orders#add_address"
  get '/addressform', to: "orders#address_form"
  get '/address', to: "orders#address"
  get '/edit', to: "orders#edit"
  post '/update', to: "orders#update_address"

  get '/payment', to: "orders#payment"
  
  post '/addtorent', to: "orders#add_to_rent"
  get 'rent', to: "orders#rent"

  get 'otp_form', to: 'pages#otp_form'
  post 'generate_otp', to: 'pages#generate_otp'
  get 'otp_verify', to: 'pages#otp_verify'
  post 'otp_verification', to: 'pages#otp_verification'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
