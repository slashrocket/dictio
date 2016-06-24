class AddAcronymToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :acronym, :boolean, null: false, default: false
  end
end
