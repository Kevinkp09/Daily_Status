class RemoveRemarksColumnFromStatus < ActiveRecord::Migration[7.1]
  def change
    remove_column :statuses, :remarks
  end
end
