# frozen_string_literal: true

# == Route Map
#
#                           Prefix Verb     URI Pattern                                                                              Controller#Action
#                      rails_admin          /admin                                                                                   RailsAdmin::Engine
#       native_oauth_authorization GET      /oauth/authorize/native(.:format)                                                        doorkeeper/authorizations#show
#              oauth_authorization GET      /oauth/authorize(.:format)                                                               doorkeeper/authorizations#new
#                                  DELETE   /oauth/authorize(.:format)                                                               doorkeeper/authorizations#destroy
#                                  POST     /oauth/authorize(.:format)                                                               doorkeeper/authorizations#create
#                      oauth_token POST     /oauth/token(.:format)                                                                   doorkeeper/tokens#create
#                     oauth_revoke POST     /oauth/revoke(.:format)                                                                  doorkeeper/tokens#revoke
#                 oauth_introspect POST     /oauth/introspect(.:format)                                                              doorkeeper/tokens#introspect
#               oauth_applications GET      /oauth/applications(.:format)                                                            doorkeeper/applications#index
#                                  POST     /oauth/applications(.:format)                                                            doorkeeper/applications#create
#            new_oauth_application GET      /oauth/applications/new(.:format)                                                        doorkeeper/applications#new
#           edit_oauth_application GET      /oauth/applications/:id/edit(.:format)                                                   doorkeeper/applications#edit
#                oauth_application GET      /oauth/applications/:id(.:format)                                                        doorkeeper/applications#show
#                                  PATCH    /oauth/applications/:id(.:format)                                                        doorkeeper/applications#update
#                                  PUT      /oauth/applications/:id(.:format)                                                        doorkeeper/applications#update
#                                  DELETE   /oauth/applications/:id(.:format)                                                        doorkeeper/applications#destroy
#    oauth_authorized_applications GET      /oauth/authorized_applications(.:format)                                                 doorkeeper/authorized_applications#index
#     oauth_authorized_application DELETE   /oauth/authorized_applications/:id(.:format)                                             doorkeeper/authorized_applications#destroy
#                 oauth_token_info GET      /oauth/token/info(.:format)                                                              doorkeeper/token_info#show
#                 new_user_session GET      /users/sign_in(.:format)                                                                 devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                                                                 devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)                                                                devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)                                                           users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)                                                  users/omniauth_callbacks#facebook
#                new_user_password GET      /users/password/new(.:format)                                                            devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)                                                           devise/passwords#edit
#                    user_password PATCH    /users/password(.:format)                                                                devise/passwords#update
#                                  PUT      /users/password(.:format)                                                                devise/passwords#update
#                                  POST     /users/password(.:format)                                                                devise/passwords#create
#         cancel_user_registration GET      /users/cancel(.:format)                                                                  devise/registrations#cancel
#            new_user_registration GET      /users/sign_up(.:format)                                                                 devise/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                                                                    devise/registrations#edit
#                user_registration PATCH    /users(.:format)                                                                         devise/registrations#update
#                                  PUT      /users(.:format)                                                                         devise/registrations#update
#                                  DELETE   /users(.:format)                                                                         devise/registrations#destroy
#                                  POST     /users(.:format)                                                                         devise/registrations#create
#             api_v1_profile_index GET      /api/v1/profile(.:format)                                                                api/v1/profile#index
#                  api_v1_products GET      /api/v1/products(.:format)                                                               api/v1/products#index
#                    product_index GET      /product(.:format)                                                                       product#index
#                          product GET      /product/:id(.:format)                                                                   product#show
#                           brands GET      /brands(.:format)                                                                        brands#index
#                            brand GET      /brands/:id(.:format)                                                                    brands#show
#                         category GET      /category/:id(.:format)                                                                  category#show
#                     search_index GET      /search(.:format)                                                                        search#index
#                       cart_items POST     /cart/items(.:format)                                                                    items#create
#                        cart_item DELETE   /cart/items/:id(.:format)                                                                items#destroy
#                             cart GET      /cart(.:format)                                                                          carts#show
#                                  DELETE   /cart(.:format)                                                                          carts#destroy
#                             root GET      /                                                                                        main#index
#               rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#        rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#               rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#        update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#             rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  use_doorkeeper
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :api do
    namespace :v1 do
      resources :profile,   only: [:index]
      resources :products,  only: [:index]
    end
  end

  resources :product,   only: %i[index show]
  resources :brands,    only: %i[index show]
  resources :category,  only: [:show]
  resources :search,    only: [:index]

  resource :cart, only: %i[destroy show] do
    resources :items, only: %i[destroy create]
  end

  root to: 'main#index'
end
