# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Brands", type: :request do
  describe "GET /index" do
    let(:brand) { create(:brand) }

    it "returns http success" do
      get brands_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:brand) { create(:brand) }

    it "returns http success" do
      get brand_path(brand)
      expect(response).to have_http_status(:success)
    end
  end
end
