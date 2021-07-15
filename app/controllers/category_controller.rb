class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    set_page_options
  end

  private

  def set_page_options
    set_meta_tags @category.slice(:title, :description, :keywords)
    add_breadcrumb 'Home', :root_path, title: 'Home'
  end
end
