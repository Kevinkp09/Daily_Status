class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.string :screenshot

      t.timestamps
    end
  end
end
