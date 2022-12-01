class RemoveColumnUserIdToJourney < ActiveRecord::Migration[7.0]
  def change
    remove_column :journeys, :user_id, :references
  end
end
