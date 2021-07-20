class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit

  protect_from_forgery with: :exception

  def current_cart
    @current_cart ||= Cart.find_or_create_by(user: current_user)
  end

  delegate :cart_items, to: :current_cart

  helper_method :current_cart, :cart_items

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    if current_user
      flash[:alert] = 'You must be an administrator to access this page'
    else
      flash[:alert] = 'You need to sign in or sign up before continuing'
    end
    redirect_to main_app.root_path
  end
end
