class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :key, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
