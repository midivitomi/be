class AddLevelToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :level, :string, :limit => 3
  end
end
