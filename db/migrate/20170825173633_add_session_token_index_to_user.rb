class AddSessionTokenIndexToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :session_token, unique: true
  end
end
