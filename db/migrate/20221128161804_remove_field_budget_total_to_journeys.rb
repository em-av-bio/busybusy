class RemoveFieldBudgetTotalToJourneys < ActiveRecord::Migration[7.0]
  def change
    remove_column :journeys, :budget_total
  end
end
