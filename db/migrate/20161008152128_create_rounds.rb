class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.references :competition, null: false
      t.string :title, null: false
      t.string :title2
      t.date :start_at, null: false
      t.date :end_at

      t.timestamps
    end
  end
end
