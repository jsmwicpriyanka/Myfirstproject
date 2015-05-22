class AddUserIdToFriendables < ActiveRecord::Migration
  def change
    add_column :friendables, :user_id, :integer
  end
end
