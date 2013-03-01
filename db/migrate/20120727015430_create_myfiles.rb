class CreateMyfiles < ActiveRecord::Migration
  def change
    create_table :myfiles do |t|
      t.integer :user_id
      t.string :filename
      t.string :caption

      t.timestamps
    end
  end
end
