class CreateFriendables < ActiveRecord::Migration
  def change
    create_table :friendables do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :accepted
      t.boolean :rejected

      t.timestamps null: false
    end
  end
end
