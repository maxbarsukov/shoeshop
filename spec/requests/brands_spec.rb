# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Brands", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/brands/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/brands/show"
      expect(response).to have_http_status(:success)
    end
  end
end
