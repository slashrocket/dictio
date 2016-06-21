# == Schema Information
#
# Table name: definitions
#
#  id         :integer          not null, primary key
#  meaning    :text
#  term_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase

  test 'has valid test data for basic definition' do
    assert definitions(:slashrocketDef).valid?, "Expected
    #{definitions(:slashrocketDef).inspect} to be valid"
  end

  test 'should successfully save a defintion' do
    definition = Definition.new
    definition.term_id = definitions(:slashrocketDef).term
    definition.meaning = definitions(:slashrocketDef).meaning
    assert definition.save, 'Term did not save.'
  end

end
