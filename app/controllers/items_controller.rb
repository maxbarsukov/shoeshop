class ItemsController < ApplicationController
  include CartsHelper

  layout false

  def create
    cart_items.create(item_params)
  end

  def destroy
    cart_items.find_by(item_params).destroy!
    render :create
  end

  private

  def item_params
    params.permit(:product_id, :quantity)
  end

  helper_method :products
end
