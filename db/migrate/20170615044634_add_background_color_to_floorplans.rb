class AddBackgroundColorToFloorplans < ActiveRecord::Migration[5.0]
  def change
    add_column :floorplans, :background, :string
  end
end
