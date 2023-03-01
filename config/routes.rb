require 'sidekiq/web'
Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'
  resources :books
  resources :admins
  root to: 'pages#home'
  resources :pages
  resources :categories
 
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users
  get 'otp_form', to: 'pages#otp_form'
  post 'generate_otp', to: 'pages#generate_otp'
  get 'otp_verify', to: 'pages#otp_verify'
  post 'otp_verification', to: 'pages#otp_verification'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
