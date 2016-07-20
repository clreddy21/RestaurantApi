class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :rating
      t.integer :pincode
      t.string :address
      t.string :mobile

      t.timestamps null: false
    end
  end
end
