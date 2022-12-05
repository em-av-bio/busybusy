class AddColumnToJourneyDates < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_dates, :ranking, :integer
  end
end
