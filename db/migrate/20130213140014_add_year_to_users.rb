class AddYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :year, :integer, :default => 2013
    
  end
end
