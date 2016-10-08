class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.references :league, null: false
      t.references :season, null: false
      t.string :title
      t.date :start_at, null: false
      t.date :end_at

      t.timestamps
    end
  end
end
