class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.integer :progress
      t.integer :hours
      t.string :start_date
      t.string :end_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
