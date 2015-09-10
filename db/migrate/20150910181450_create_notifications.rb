class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.boolean :read, default: false
      t.text :message
      t.timestamps null: false
    end
  end
end
