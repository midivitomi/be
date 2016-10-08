class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string     :key
      t.references :round, null: false
      t.integer    :pos,  null: false
      t.references :group
      t.references :team1, null: false
      t.references :team2, null: false

      t.datetime   :play_at, null: false
      t.boolean    :postponed, null: false, default: false
      t.datetime   :play_at_v2
      t.datetime   :play_at_v3

      t.references :ground
      t.references :city

      t.timestamps
    end
  end
end
