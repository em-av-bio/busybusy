class CreateLocationAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :location_accommodations do |t|
      t.references :location, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
