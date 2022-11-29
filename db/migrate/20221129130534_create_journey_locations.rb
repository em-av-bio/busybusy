class CreateJourneyLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_locations do |t|
      t.references :location, null: false, foreign_key: true
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
