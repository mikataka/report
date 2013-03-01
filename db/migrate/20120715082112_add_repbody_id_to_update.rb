class AddRepbodyIdToUpdate < ActiveRecord::Migration
  def change
    add_column :updates, :repbody_id, :integer
  end
end
