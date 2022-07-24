class CreateMotivations < ActiveRecord::Migration[7.0]
  def change
    create_table :motivations do |t|
      t.string :goal
      t.string :reward

      t.timestamps
    end
  end
end
