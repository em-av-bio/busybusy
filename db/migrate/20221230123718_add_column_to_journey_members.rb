class AddColumnToJourneyMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :journey_members, :solde, :integer
  end
end
