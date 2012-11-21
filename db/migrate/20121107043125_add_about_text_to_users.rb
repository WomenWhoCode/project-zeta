class AddAboutTextToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about_text, :text
  end
end
