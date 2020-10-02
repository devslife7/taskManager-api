class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :progress
      t.string :description
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
