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
  validates :meaning, presence: true,
                      length: {
                        minimum: 100, too_short: "requires at least %{count} characters",
                        maximum: 750, too_long: "is limited to %{count} characters."
                      }
end
