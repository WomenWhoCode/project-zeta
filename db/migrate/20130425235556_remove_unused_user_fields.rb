class RemoveUnusedUserFields < ActiveRecord::Migration
  def up
    remove_index  :users, :remember_token
    remove_column :users, :remember_token, :string
    remove_column :users, :password_digest, :string
  end

  def down
    add_column :users, :remember_token, :string
    add_column :users, :password_digest, :string
    add_index  :users, :remember_token
  end
end
