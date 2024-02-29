class CreateRemarks < ActiveRecord::Migration[7.1]
  def change
    create_table :remarks do |t|
      t.text :content
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
