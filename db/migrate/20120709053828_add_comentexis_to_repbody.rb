class AddComentexisToRepbody < ActiveRecord::Migration
  def change
    add_column :repbodies, :commentexis, :string
  end
end
