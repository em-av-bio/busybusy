class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
