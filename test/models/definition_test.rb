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
    assert_valid definitions(:slashrocketDef)
  end

  test 'should successfully instantiate a definition' do
    definition = Definition.new
    definition.term_id = definitions(:slashrocketDef).term
    assert definition, 'Term was not instantiated.'
  end

  test 'should successfully save a defintion' do
    definition = Definition.new
    definition.term_id = definitions(:slashrocketDef).term
    definition.meaning = definitions(:slashrocketDef).meaning
    assert definition.save, 'Term did not save.'
  end

end
