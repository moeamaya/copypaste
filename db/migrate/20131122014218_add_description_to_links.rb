class AddDescriptionToLinks < ActiveRecord::Migration
  def change
    add_column :links, :description, :text
    add_column :links, :thumbnail, :text
  end
end
