class Beatboxer < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :youtube_videos
    has_many :bookmarks
end
