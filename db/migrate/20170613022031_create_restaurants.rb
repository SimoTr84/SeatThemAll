class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :image
      t.integer :operator_id

      t.timestamps
    end
  end
end
