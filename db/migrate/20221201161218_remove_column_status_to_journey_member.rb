class RemoveColumnStatusToJourneyMember < ActiveRecord::Migration[7.0]
  def change
    remove_column :journey_members, :status, :integer
  end
end
