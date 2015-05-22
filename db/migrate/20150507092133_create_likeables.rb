class CreateLikeables < ActiveRecord::Migration
  def change
    create_table :likeables do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
