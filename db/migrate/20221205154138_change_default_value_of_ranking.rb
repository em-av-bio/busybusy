class ChangeDefaultValueOfRanking < ActiveRecord::Migration[7.0]
  def change
    change_column_default :journey_locations, :ranking, 0
    change_column_default :journey_dates, :ranking, 0
    change_column_default :journey_activities, :ranking, 0
  end
end
