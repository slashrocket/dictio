class AddUsernameIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :username, using: 'btree'
  end
end
