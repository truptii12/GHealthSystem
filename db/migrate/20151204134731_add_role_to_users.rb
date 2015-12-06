class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :users, :string
  end
end
