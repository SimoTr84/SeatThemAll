class CreateFloorplans < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplans do |t|
      t.integer :top
      t.integer :left
      t.integer :height
      t.integer :width
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
