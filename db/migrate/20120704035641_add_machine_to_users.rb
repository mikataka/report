class AddMachineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :machine, :string
  end
end
