# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :product,   only: [:show]
  resources :category,  only: [:show]
  resources :search,    only: [:index]

  resource :cart, only: %i[destroy show] do
    resources :items, only: %i[destroy create]
  end

  root to: 'main#index'
end
