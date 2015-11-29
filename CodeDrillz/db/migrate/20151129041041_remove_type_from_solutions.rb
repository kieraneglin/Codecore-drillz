class RemoveTypeFromSolutions < ActiveRecord::Migration
  def change
    remove_column :solutions, :type
  end
end
