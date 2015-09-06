class AddCoordToPlace < ActiveRecord::Migration
  def change
    add_column :places, :coordinates, :string
  end
end
