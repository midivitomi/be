class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :round, null: false
      t.references :group
      t.references :team1, null: false
      t.references :team2, null: false

      t.datetime   :play_at, null: false

      t.references :ground
      t.references :city

      t.timestamps
    end
  end
end
