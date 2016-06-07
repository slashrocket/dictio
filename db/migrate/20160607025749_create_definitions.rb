class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :meaning
      t.references :term, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
