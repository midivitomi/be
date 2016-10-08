class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :key, null: false
      t.string :title, null: false
      t.string :title2
      t.string :synonyms
      t.references :country, null: false
      t.references :city

      t.timestamps
    end
  end
end
