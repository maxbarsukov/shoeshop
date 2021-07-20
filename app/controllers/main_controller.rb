class MainController < ApplicationController
  def index
    @brands = Brand.limit(3)
    @hits   = Product.active.hit.limit(8)
  end
end
