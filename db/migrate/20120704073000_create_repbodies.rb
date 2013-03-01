class CreateRepbodies < ActiveRecord::Migration
  def change
    create_table :repbodies do |t|
      t.integer :user_id
      t.integer :tag_id
      t.date :date
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
