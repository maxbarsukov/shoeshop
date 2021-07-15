class ApplicationController < ActionController::Base
  include Pundit

  def current_cart
    @current_cart ||= Cart.find_or_create_by(user: current_user)
  end

  def cart_items
    current_cart.cart_items
  end

  helper_method :current_cart, :cart_items
end
