class AddOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :owner, :string
  end
end
