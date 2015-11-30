class AddBadgeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :badge, :string
  end
end
