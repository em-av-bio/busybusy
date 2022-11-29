class CreateJourneyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_dates do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :selected?, default: false
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
