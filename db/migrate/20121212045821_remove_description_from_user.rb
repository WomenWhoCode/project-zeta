class RemoveDescriptionFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :description
  end

  def down
    add_column :users, :description, :text
  end
end
