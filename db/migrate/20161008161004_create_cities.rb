class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :key, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
