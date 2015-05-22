class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :status_id
      t.integer :name_id

      t.timestamps null: false
    end
  end
end
