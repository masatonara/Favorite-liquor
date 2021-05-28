class CreateLiquors < ActiveRecord::Migration[5.2]
  def change
    create_table :liquors do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name
      t.string :liquor_image_id
      t.text :introduction
      t.string :liquor_genre
      t.string :restaurant_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :day
      t.float :rate


      t.timestamps
    end
  end
end
