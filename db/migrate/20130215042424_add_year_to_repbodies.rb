class AddYearToRepbodies < ActiveRecord::Migration
  def change
    add_column :repbodies, :year, :integer, :defailt => '2013'
  end
end
