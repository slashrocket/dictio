# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Term < ActiveRecord::Base
  has_many :definitions, dependent: :destroy

  accepts_nested_attributes_for :definitions

  validates :name,  presence: true,
                    uniqueness: {case_sensitive: false },
                    length: {
                      minimum: 4, too_short: "requires at least %{count} characters",
                      maximum: 50, too_long: "is limited to %{count} characters."
                    }

  validates :acronym, length: { in: 2..15 }, allow_blank: true

  validates_associated :definitions

  before_save :titleize_name

  default_scope { order('name ASC') }

  def titleize_name
    if self.name[1].match /[[:lower:]]/
      self.name = self.name.titleize
    end
  end

end
