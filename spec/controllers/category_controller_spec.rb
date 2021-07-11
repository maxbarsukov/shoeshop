# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  render_views

  describe 'GET #show' do
    let(:category) { create :category }
    let!(:products) { create_list :product, 2, category: category }

    subject { get :show, params: { id: category.id } }

    context 'find products for this category' do
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
end
