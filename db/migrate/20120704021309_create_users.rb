class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :username
      t.string :studentid
      t.string :email
      t.integer :role_id
      t.string :grade
      t.string :password_digest

      t.timestamps
    end
  end
end
