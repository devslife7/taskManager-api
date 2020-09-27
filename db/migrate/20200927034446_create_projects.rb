class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :start_date
      t.string :deadline
      t.string :completion_percentage

      t.timestamps
    end
  end
end
