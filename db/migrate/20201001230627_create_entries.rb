class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :date
      t.integer :progress
      t.string :notes
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
