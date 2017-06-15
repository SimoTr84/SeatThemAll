class AddElementIdToFloorplans < ActiveRecord::Migration[5.0]
  def change
    add_column :floorplans, :element_id, :integer
  end
end
