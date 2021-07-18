# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
  render_views

  describe 'GET #show' do
    let(:brand) { create :brand }
    let!(:products) { create_list :product, 2, brand: brand }

    subject { get :show, params: { id: brand.id } }

    context 'find products for this brand' do
      it 'render show view' do
        is_expected.to render_template :show
      end
      it 'product data in response' do
        is_expected.to render_template :show
        expect(response.body).to include(products.first.title,
                                         products.second.title)
      end
    end
  end

  describe 'GET #index' do
    let!(:brands) { create_list :brand, 2 }

    before { get :index }

    context 'show brands' do
      it 'render index view' do
        is_expected.to render_template :index
      end

      it 'instance var brands includes all brands' do
        expect(assigns(:brands)).to match_array(brands)
      end

      it 'brands data in response' do
        expect(response.body).to include(brands.first.title,
                                         brands.second.title)
      end
    end
  end
end
