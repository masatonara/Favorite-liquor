class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.integer :liquor_id
      t.string :restaurant_name
      t.text :restaurant_address
      t.string :image
      t.text :introduction
      t.string :phone

      t.timestamps
    end
  end
end
