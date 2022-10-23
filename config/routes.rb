# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_sessions, only: %i[new create destroy]

  get 'sign_in', to: 'user_sessions#new'
end
