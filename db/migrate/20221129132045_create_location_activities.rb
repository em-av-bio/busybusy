class CreateLocationActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :location_activities do |t|
      t.references :location, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
