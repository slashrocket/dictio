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
  validates :name, presence: true
  has_many :definitions
  
end
