# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  render_views

  describe 'GET #show' do
    let(:product) { create :product }
    let!(:user) { create :user }

    subject { get :show, params: { id: product.id } }

    context 'show product' do
      it 'render show view' do
        sign_in user
        is_expected.to render_template :show
      end
    end
  end

  describe 'GET #index' do
    let!(:products) { create_list :product, 5 }

    before { get :index }

    context 'show products' do
      it 'render index view' do
        is_expected.to render_template :index
      end

      it 'instance var products includes all products' do
        expect(assigns(:products)).to match_array(products)
      end

      it 'products data in response' do
        expect(response.body).to include(products.first.title,
                                         products.second.title)
      end
    end
  end
end
