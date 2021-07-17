class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  def current_cart
    @current_cart ||= Cart.find_or_create_by(user: current_user)
  end

  delegate :cart_items, to: :current_cart

  helper_method :current_cart, :cart_items

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'Log in or Sign Up to view this content'
  end
end
