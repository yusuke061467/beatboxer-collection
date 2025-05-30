class DropBeatboxer < ActiveRecord::Migration[7.2]
  def up
    remove_foreign_key :posts, :beatboxers
    drop_table :beatboxers
  end

  def down
    create_table :beatboxers do |t|
      create_table :beatboxers do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :style, null: false
      t.string :achievements
      t.integer :sex, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    end
  end
end
