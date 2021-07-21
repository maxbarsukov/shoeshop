class ProductController < ApplicationController
  before_action :set_product, only: [:show]
  helper_method :recent_products

  after_action :register_visit, only: [:show]

  def index
    if params['search']
      @filter = params['search']['brands'].concat(params['search']['categories']).flatten.reject(&:blank?)
      @products = @filter.empty? ? Product.active : Product.active.tagged_with(@filter, any: true)
    else
      @products = Product.active
    end
    @pagy, @products = pagy(@products)
  end

  def show
    authorize @product
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
