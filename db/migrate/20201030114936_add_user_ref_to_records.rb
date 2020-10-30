class AddUserRefToRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :records, :user, null: false, foreign_key: true
    add_reference :records, :task, null: false, foreign_key: true
  end
end
