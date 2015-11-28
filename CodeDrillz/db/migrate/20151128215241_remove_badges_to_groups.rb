class RemoveBadgesToGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :badges, :integer
  end
end
