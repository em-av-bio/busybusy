class AddColumnToJourneyLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_locations, :ranking, :integer
  end
end
