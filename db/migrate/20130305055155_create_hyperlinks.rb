class CreateHyperlinks < ActiveRecord::Migration
  def change
    create_table :hyperlinks do |t|
      t.integer :repbody_id
      t.string :link

      t.timestamps
    end
  end
end
