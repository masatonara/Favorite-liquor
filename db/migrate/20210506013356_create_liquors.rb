class CreateLiquors < ActiveRecord::Migration[5.2]
  def change
    create_table :liquors do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.text :introduction
      t.string :genre
      t.string :restaurant_name
      t.text :restaurant_address
      t.date :day
      t.float :rating
      

      t.timestamps
    end
  end
end
