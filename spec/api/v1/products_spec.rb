# frozen_string_literal: true

require 'rails_helper'

describe 'Products API' do
  let(:api_url) { '/api/v1/products' }

  describe 'GET #index' do
    context 'for auth users' do
      let(:user)           { create :user }
      let(:product)        { products.first }
      let(:access_token)   { create(:access_token, resource_owner_id: user.id) }
      let(:params) {       { format: :json, access_token: access_token.token } }

      let!(:products) { create_list :product, 2 }
      let!(:category) { create(:category) }

      before { get api_url, params: params }

      it 'returns 200 status code' do
        expect(response).to be_successful
      end

      it 'returns list of products' do
        expect(response.body).to have_json_size(2)
      end

      %w[id title bytitle content price old_price description].each do |attr|
        it "product contains #{attr}" do
          expect(response.body).to be_json_eql(product.send(attr.to_sym).to_json)
            .at_path("0/#{attr}")
        end
      end

      it 'product object contains short_title' do
        expect(response.body).to be_json_eql(product.title.truncate(8).to_json)
          .at_path('0/short_title')
      end

      context 'category' do
        it 'included in product object' do
          expect(response.body).to have_json_size(8).at_path('0/category')
        end

        %w[title bytitle].each do |attr|
          it "contains #{attr}" do
            expect(response.body).to be_json_eql(category.send(attr.to_sym).to_json)
              .at_path("0/category/#{attr}")
          end
        end
      end
    end
  end
end
