class MainController < ApplicationController
  before_action :set_page_options

  def index
    @brands = Brand.limit(3)
    @hits   = Product.hit.limit(8)
  end

  def set_page_options
    @page_title = 'Shoe Store'
    @page_description = 'The Best Fake Shoe Store That Ever Existed'
    @page_keywords = 'Shoe Store Man Woman Kids'
  end
end
