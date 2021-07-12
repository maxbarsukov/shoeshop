class CartsController < ApplicationController
  include CartsHelper

  layout false

  def show; end

  def destroy
    current_cart.destroy
    render :show
  end
end
