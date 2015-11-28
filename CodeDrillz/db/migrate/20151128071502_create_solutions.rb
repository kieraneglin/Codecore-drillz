class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :drill, index: true, foreign_key: true
      t.text :correct_answer
      t.integer :type

      t.timestamps null: false
    end
  end
end
