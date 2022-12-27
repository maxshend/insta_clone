# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages, only: %i[index]
  resources :user_sessions, only: %i[new create destroy]

  root to: 'pages#index'

  get 'sign_in', to: 'user_sessions#new'
end
