class AddLockVersionToRepbodies < ActiveRecord::Migration
  def change
    add_column :repbodies, :lock_version, :integer, :default => 0
  end
end
