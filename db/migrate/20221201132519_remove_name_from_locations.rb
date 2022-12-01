class RemoveNameFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :name
  end
end
