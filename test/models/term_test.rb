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

  test 'has valid test data for basic term' do
    assert terms(:slashrocket).valid?, "Expected
    #{terms(:slashrocket).inspect} to be valid"
  end

  test 'should successfully save a term' do
    term = Term.new
    term.name = terms(:slashrocket).name
    assert term.save, 'Term did not save.'
  end

  test 'should be invalid without a name' do
    term = Term.new
    assert !term.valid?, 'Name is not being validated.'
  end

end
