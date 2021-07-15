class ProductController < ApplicationController
  before_action :set_product
  helper_method :recent_products

  after_action :register_visit, only: [:show]

  def show
    set_page_options
  end

  def recent_products
    [] if recently.none?
    Product.where(id: recently)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def recently
    session[:viewed_products] ||= []
  end

  def register_visit
    session[:viewed_products] ||= []
    session[:viewed_products] =
      ([@product.id] + session[:viewed_products])
        .uniq
        .take(3)
  end

  def set_page_options
    set_meta_tags @product.slice(:title, :description, :keywords)
    add_breadcrumb 'Home', :root_path, title: 'Home'
  end
end
