class AddDefaultToYear < ActiveRecord::Migration
  def change
    add_column :years, :default, :boolean
  end
end
