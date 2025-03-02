class CreateBeatboxers < ActiveRecord::Migration[8.0]
  def change
    create_table :beatboxers do |t|
      t.string :name, null false
      t.string :country, null:false
      t.string :style, null:false
      t.string :achievements
      t.integer :sex, null: false
      
      t.timestamps
    end
  end
end
