class AddStatusIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :status_id, :integer
  end
end
