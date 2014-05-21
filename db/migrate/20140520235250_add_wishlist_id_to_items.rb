class AddWishlistIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :wishlist_id, :integer
  end
end
