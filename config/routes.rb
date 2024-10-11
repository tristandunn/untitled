# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts, only: %i(new create)
  resource  :sessions, only: %i(new create destroy)

  get "/health", to: "health#index"

  root "pages#index"
end
