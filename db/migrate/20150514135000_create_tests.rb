class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
