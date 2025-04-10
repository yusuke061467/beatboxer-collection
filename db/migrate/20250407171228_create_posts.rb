class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title,            null: false
      t.string :youtube_video
      t.string :body,              null: false

      t.references :user, foreign_key: true
      t.references :beatboxer, foreign_key: true

      t.timestamps null: false
    end
  end
end
