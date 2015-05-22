class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :about_you
      t.string :name_type
      t.string :name
      t.string :fav_quotes
      t.string :relationship_status
      t.string :gender
      t.string :birth_year
      t.string :birth_date
      t.string :work
      t.string :religious_view
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
