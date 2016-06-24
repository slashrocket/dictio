class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :first_name, using: 'btree'
    add_index :users, :last_initial, using: 'btree'

  end
end
