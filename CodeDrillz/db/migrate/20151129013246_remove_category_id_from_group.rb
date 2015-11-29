class RemoveCategoryIdFromGroup < ActiveRecord::Migration
  def change
  	remove_column :groups, :category_id
  end
end
