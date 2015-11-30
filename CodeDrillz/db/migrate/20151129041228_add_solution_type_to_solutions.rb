class AddSolutionTypeToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :solution_type, :integer
  end
end
