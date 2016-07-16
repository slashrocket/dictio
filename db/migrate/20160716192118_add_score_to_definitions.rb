class AddScoreToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :score, :integer, default: 0, null: false
  end
end
