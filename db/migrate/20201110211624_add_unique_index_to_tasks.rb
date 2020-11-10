class AddUniqueIndexToTasks < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, [:name, :user_id], unique: true
  end
end
