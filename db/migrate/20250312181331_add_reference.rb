class AddReference < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true

    add_reference :beatboxers, :user, foreign_key: true

    add_reference :bookmarks, :user, foreign_key: true
    add_reference :bookmarks, :post, foreign_key: true
  end
end
