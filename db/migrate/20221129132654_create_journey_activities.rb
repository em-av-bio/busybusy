class CreateJourneyActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_activities do |t|
      t.references :journey, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.boolean :selected?

      t.timestamps
    end
  end
end
