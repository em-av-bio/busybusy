class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :duration_in_h
      t.text :details
      t.timestamps
    end
  end
end
