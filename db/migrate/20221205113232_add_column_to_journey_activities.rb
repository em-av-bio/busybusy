class AddColumnToJourneyActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_activities, :ranking, :integer
  end
end
