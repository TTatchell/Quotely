# frozen_string_literal: true

Rails.application.routes.draw do
  resources :quotes
  resources :quotes do
    resources :likes
  end
  resources :users do
    resources :quotes, only: [:index]
  end
  get 'users/:id/user_quotes' => 'users#user_quotes', :as => :custom_user_quotes

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
end
