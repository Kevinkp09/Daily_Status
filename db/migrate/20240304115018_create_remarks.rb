class CreateRemarks < ActiveRecord::Migration[7.1]
  def change
    create_table :remarks do |t|
      t.string :description
      t.references :remarkable, polymorphic: true
      t.timestamps
    end
  end
end
