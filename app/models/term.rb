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

  validates :name, presence: true
  validates_associated :definitions

  before_save :capitalize_name

  default_scope { order('name ASC') }

  def capitalize_name
    self.name = self.name.capitalize
  end
end
