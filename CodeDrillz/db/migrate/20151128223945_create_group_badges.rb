class CreateGroupBadges < ActiveRecord::Migration
  def change
    create_table :group_badges do |t|
      t.references :group, index: true, foreign_key: true
      t.references :badge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
