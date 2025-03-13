class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :beatboxers
  has_many :comments
  has_many :youtube_videos
  has_many :bookmarks
end
