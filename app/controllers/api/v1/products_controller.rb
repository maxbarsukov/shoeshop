class Api::V1::ProductsController < Api::V1::BaseApiController
  skip_before_action :doorkeeper_authorize!, on: :index

  def index
    @products = Product
                  .all
                  .includes([:related, :category])
                  .limit(5)
    respond_with @products
  end
end
