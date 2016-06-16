# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TermTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should successfully save a term" do
    term = Term.new
    assert_not term.save, "Term saved without name."
  end
  
  test "should be invalid without a name" do
    term = Term.new
    assert !term.valid?, "Name is not being validated."
  end
end
