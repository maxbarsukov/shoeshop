class ProductController < ApplicationController
  before_action :set_product, only: %i[show set_page_options]

  def show
    set_page_options
  end

  def set_page_options
    set_meta_tags @product.slice(:title, :description, :keywords)
    add_breadcrumb 'Home', :root_path, title: 'Home'
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
