class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :beatboxers
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  mount_uploader :avatar, AvatarUploader

  with_options presence: true do
    validates :name
    validates :email
  end

  with_options if: -> { new_record? || changes[:crypted_password] } do
    validates :password, length: { minimum: 8 }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
  end

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def own?(object)
    id = object.user_id
  end

  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.delete(post)
  end

  def bookmark?(post)
    bookmark_posts.exists?(post.id)
  end
end
