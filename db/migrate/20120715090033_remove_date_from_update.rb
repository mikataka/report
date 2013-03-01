class RemoveDateFromUpdate < ActiveRecord::Migration
  def up
    remove_column :updates, :date
      end

  def down
    add_column :updates, :date, :date
  end
end
