class CreateJourneyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_members do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :budget
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
