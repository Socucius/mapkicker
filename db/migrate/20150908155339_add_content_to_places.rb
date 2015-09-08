class AddContentToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :content, :text
  end
end
