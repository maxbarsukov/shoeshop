# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  render_views

  let(:user)       { create :user }
  let(:product)    { create :product }
  let(:cart)       { create :cart, user: user }
  let!(:item) { create :cart_item, cart: cart, product: product }

  let(:create_params) { { quantity: 1, product_id: product.id } }

  describe 'POST #create' do
    subject { post :create, params: create_params }

    context 'with valid attributes' do
      it 'saves the new item in the table cart_items' do
        sign_in user
        expect { subject }.to change(user.cart.cart_items, :count).by(1)
      end

      it 'render show view' do
        sign_in user
        is_expected.to render_template(:create)
      end
    end

    context 'with invalid attributes' do
      let(:create_params) { { quantity: 0 } }

      it 'does not save item' do
        sign_in user
        expect { subject }.to_not change(user.cart.cart_items, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:create_params) { { id: product.id, product_id: product.id } }

    subject { delete :destroy, params: create_params }

    it 'delete product from item' do
      sign_in user
      expect { subject }.to change(user.cart.cart_items, :count).by(-1)
    end

    it 'render template create' do
      sign_in user
      is_expected.to render_template :create
    end

    it 'gets all products in the cart' do
      sign_in user
      expect(controller.products)
        .to include(have_attributes(product_id: product.id))
    end
  end
end
