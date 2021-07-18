class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :progress, default: 0
      t.string :description
      t.integer :start_date
      t.integer :end_date

      t.timestamps
    end
  end
end
