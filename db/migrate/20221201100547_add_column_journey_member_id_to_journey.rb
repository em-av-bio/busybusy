class AddColumnJourneyMemberIdToJourney < ActiveRecord::Migration[7.0]
  def change
    add_reference :journeys, :journey_member, foreign_key: true
  end
end
