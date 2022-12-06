class AddPriceToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :price, :string
  end
end
