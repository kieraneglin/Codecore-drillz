class AddFieldsToUsers < ActiveRecord::Migration
  def change
    unless column_exists? :users, :first_name
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :email, :string
      add_column :users, :password_digest, :string
    end
  end
end
