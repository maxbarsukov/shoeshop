# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product,   only: [:show]
  resources :category,  only: [:show]
  resources :search,    only: [:index]

  root to: 'main#index'
end
