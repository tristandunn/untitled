# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts, only: %i(new create)
  resource  :sessions, only: %i(new create destroy)

  # Reveal health status on /up that returns 200 if the app boots with no
  # exceptions, otherwise 500. Can be used by load balancers and uptime
  # monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Enable the Litestream dashboard if a password is set.
  if Litestream.password
    mount Litestream::Engine, at: "/litestream"
  end

  root "pages#index"
end
