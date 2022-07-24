class CreateTimerecords < ActiveRecord::Migration[7.0]
  def change
    create_table :timerecords do |t|
      t.string :timetype
      t.integer :period
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
