require 'rails_helper'

RSpec.describe "Beatboxers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/beatboxers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/beatboxers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/beatboxers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/beatboxers/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
