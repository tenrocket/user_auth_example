class AddShippingToItems < ActiveRecord::Migration
  def change
  	add_column :items, :shipping, :string
  end
end
