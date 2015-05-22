class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :status
      t.integer :user_id
      t.integer :email_id
      add_index :posts, :created_at, :updated_at


      t.timestamps null: false
    end
  end
end
