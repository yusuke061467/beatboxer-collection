class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    belongs_to :user
    belongs_to :beatboxer
end
