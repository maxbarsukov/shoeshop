# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :product,   only: [:show]
  resources :category,  only: [:show]
  resources :search,    only: [:index]

  root to: 'main#index'
end
