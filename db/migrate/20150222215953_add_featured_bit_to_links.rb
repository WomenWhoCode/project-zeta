class AddFeaturedBitToLinks < ActiveRecord::Migration
  def change
    add_column :links, :featured, :boolean, default: false
  end
end
