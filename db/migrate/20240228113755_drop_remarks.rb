class DropRemarks < ActiveRecord::Migration[7.1]
  def change
    drop_table :remarks
  end
end
