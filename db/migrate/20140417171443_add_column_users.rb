class AddColumnUsers < ActiveRecord::Migration
  def up
    add_column :users, :furigana, :string, :default => 'family first'
  end

  def down
    remove_column :users, :furigana
  end
end
