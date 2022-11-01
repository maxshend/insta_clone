# frozen_string_literal: true

Rails.application.routes.draw do
  resource :dashboard, only: %i[show]
  resources :user_sessions, only: %i[new create destroy]

  root to: 'dashboard#show'

  get 'sign_in', to: 'user_sessions#new'
end
