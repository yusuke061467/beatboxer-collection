require 'rails_helper'

RSpec.describe "UserMfaSessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/user_mfa_sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_mfa_sessions/create"
      expect(response).to have_http_status(:success)
    end
  end
end
