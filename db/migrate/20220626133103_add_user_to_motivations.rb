class AddUserToMotivations < ActiveRecord::Migration[7.0]
  def change
    add_reference :motivations, :user, null: false, foreign_key: true
  end
end
