class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :title, null: false
      t.string :title2
      t.references :city

      t.timestamps
    end
  end
end
