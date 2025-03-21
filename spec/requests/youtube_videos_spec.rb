require 'rails_helper'

RSpec.describe "YoutubeVideos", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/youtube_videos/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/youtube_videos/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
