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
    assert_valid terms(:slashrocket)
  end

  test 'should successfully instantiate a term' do
    term = Term.new
    assert term, 'Term was not instantiated.'
  end

  test 'must have a name' do
    invalid_term = Term.new
    assert_invalid invalid_term
    assert_includes invalid_term.errors[:name], "can't be blank"
  end

  test 'should successfully save a term' do
    term = Term.new
    term.name = terms(:slashrocket).name
    assert term.save, 'Term did not save.'
  end

end
