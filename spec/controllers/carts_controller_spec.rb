# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  render_views

  let!(:user) { create :user }
  let(:product) { create :product }
  let(:cart) { create :cart, user: user }
  let!(:item) { create :cart_item, cart: cart, product: product }

  describe 'GET #show' do
    subject { get :show }

    it 'render show view' do
      is_expected.to render_template(:show)
      expect(response.body).to include(product.title)
    end
  end
end
