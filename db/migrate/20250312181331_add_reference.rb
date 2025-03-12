class AddReference < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :beatboxer, foreign_key: true

    add_reference :beatboxers, :user, foreign_key: true

    add_reference :youtube_videos, :user, foreign_key: true
    add_reference :youtube_videos, :beatboxer, foreign_key: true

    add_reference :bookmarks, :user, foreign_key: true
    add_reference :bookmarks, :beatboxer, foreign_key: true
  end
end
