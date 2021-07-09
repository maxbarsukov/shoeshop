# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  describe 'GET #show' do
    let(:product) { create :product }

    subject { get :show, params: { id: product.id } }

    context 'show product' do
      it 'render show view' do
        is_expected.to render_template :show
      end
    end
  end
end
