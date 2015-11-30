class CreateUserDrills < ActiveRecord::Migration
  def change
    create_table :user_drills do |t|
      t.references :user, index: true, foreign_key: true
      t.references :drill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
