class AddColumnMfaSessionToken < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :mfa_session_token, :string
  end
end
