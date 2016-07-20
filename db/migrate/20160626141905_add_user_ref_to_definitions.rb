class AddUserRefToDefinitions < ActiveRecord::Migration
  def change
    add_reference :definitions, :user, index: true, foreign_key: true
  end
end
