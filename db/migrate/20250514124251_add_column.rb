class AddColumn < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :google_secret, :string
  end
end
