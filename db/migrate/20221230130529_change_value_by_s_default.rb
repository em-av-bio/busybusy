class ChangeValueBySDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :journey_members, :solde, 0
  end
end
