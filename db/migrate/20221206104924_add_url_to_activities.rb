class AddUrlToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :url, :string
  end
end
