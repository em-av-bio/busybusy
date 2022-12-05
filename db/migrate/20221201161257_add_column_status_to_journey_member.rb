class AddColumnStatusToJourneyMember < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_members, :status, :integer, default: 0
  end
end
