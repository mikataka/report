class AddTitleToHyperlinks < ActiveRecord::Migration
  def change
    add_column :hyperlinks, :title, :string
  end
end
