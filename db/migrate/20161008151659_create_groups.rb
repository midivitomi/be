class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :competitions, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
