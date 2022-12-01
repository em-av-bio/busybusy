class RemoveColumnJourneyMembertoJourney < ActiveRecord::Migration[7.0]
  def change
    remove_column :journeys, :journey_member_id, :bigint
  end
end
