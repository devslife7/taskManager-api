class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :progress
      t.integer :hours
      t.string :notes
      t.string :start_date
      t.string :end_date
      t.references :milestone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
