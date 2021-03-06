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
class Definition < ActiveRecord::Base
  belongs_to :term

  acts_as_voteable

  validates :meaning, presence: true,
                      length: {
                        minimum: 75, too_short: "requires at least %{count} characters",
                        maximum: 750, too_long: "is limited to %{count} characters."
                      }

  default_scope { order('score DESC') }
end
