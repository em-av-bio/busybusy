class AddColumnToJourneyMember < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_members, :status, :integer
  end
end
