class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :name
      t.integer :likable_id
      t.string :likable_type

      t.timestamps null: false
    end
  end
end
