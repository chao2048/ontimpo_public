class AddCompletedAtToTodoLists < ActiveRecord::Migration[7.0]
  def change
    add_column :todo_lists, :completed_at, :datetime
  end
end
