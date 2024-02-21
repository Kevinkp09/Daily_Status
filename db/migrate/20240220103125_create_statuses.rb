class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.string :github_pr_link
      t.date :date
      t.text :remarks

      t.timestamps
    end
  end
end
