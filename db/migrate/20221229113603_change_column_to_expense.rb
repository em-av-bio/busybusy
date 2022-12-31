class ChangeColumnToExpense < ActiveRecord::Migration[7.0]
  def change
    change_column_null :expenses, :journey_id, true
  end
end
