class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :links

      t.timestamps
    end
    add_index :comments, :links_id
  end
end
