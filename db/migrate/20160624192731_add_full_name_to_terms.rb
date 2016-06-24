class AddFullNameToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :full_name, :string
  end
end
