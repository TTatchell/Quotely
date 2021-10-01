# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :quotes THIS CAN GO IF THE BELOW LINE WORKS
  resources :quotes do
    resources :likes
  end
  get 'users/:id/user_quotes' => 'users#user_quotes', :as => :custom_user_quotes
  get 'users/:id/user_likes' => 'users#user_likes', :as => :custom_user_likes

  resources :users, only: :show
  get 'user_feed', to: 'quotes#user_feed'
  root 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  # For google only
  # get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  # For all providers
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
