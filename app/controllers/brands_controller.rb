class BrandsController < ApplicationController
  before_action :set_brand, only: [:show]

  def index
    @brands = Brand.all
  end

  def show
    set_page_options
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def set_page_options
    set_meta_tags @brand.slice(:title, :description, :bytitle)
    add_breadcrumb 'Home', :root_path, title: 'Home'
  end
end
