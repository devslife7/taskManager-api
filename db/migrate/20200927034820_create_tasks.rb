class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :hours
      t.string :completion_percentage
      t.string :notes
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
