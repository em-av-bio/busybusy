class ChangeColumnTypeToRecipient < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :recipient
    add_column :expenses, :recipient, :string, array: true, default: []
  end
end
