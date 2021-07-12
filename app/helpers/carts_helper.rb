module CartsHelper
  def products
    @products = cart_items.includes(:product).all
  end
end
