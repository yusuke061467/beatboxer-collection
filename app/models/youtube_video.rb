class YoutubeVideo < ApplicationRecord
    belongs_to :user
    belongs_to :beatboxer
end
