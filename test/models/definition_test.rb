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
  # test "the truth" do
  #   assert true
  # end
end
