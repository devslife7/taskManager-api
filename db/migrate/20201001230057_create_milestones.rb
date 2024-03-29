class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.integer :progress, default: 0
      t.integer :hours, default: 0
      t.integer :start_date
      t.integer :end_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
