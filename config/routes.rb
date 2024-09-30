# frozen_string_literal: true

Rails.application.routes.draw do
  get "/health", to: "health#index"

  root "pages#index"
end
