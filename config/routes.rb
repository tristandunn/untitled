# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :pages do
    get "turbo"
  end

  root to: "pages#index"
end
