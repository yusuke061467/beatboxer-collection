class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :beatboxers
  has_many :comments
  has_many :youtube_videos
  has_many :bookmarks

  with_options presence: true do
    validates :name
    validates :email
  end

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  with_options if: -> { new_record? || changes[:crypted_password] } do
    validates :password, length: { minimum: 8 }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
  end
end
