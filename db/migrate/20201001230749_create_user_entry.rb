class CreateUserEntry < ActiveRecord::Migration[6.0]
  def change
    create_table :user_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
