class CreateJourneyAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_accommodations do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
