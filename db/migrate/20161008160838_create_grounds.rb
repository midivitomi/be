class CreateGrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :grounds do |t|
      t.string :title, null: false
      t.references :city

      t.timestamps
    end
  end
end
