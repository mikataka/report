class AddAcceptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acception, :boolean
  end
end
