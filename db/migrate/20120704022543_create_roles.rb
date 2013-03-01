class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :position

      t.timestamps
    end
  end
end
