class AddStatusToFriendables < ActiveRecord::Migration
  def change
    add_column :friendables, :status, :boolean, :default => false
  end
end
