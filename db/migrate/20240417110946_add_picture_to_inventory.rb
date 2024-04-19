class AddPictureToInventory < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :picture, :string
  end
end
