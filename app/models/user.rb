# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string
#  first_name         :string
#  last_initial       :string
#  password           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  admin              :boolean          default(FALSE), not null
#

class User < ActiveRecord::Base
  include Clearance::User

  acts_as_voter
  validates :username, presence: true,
                        length: { in: 2..15 },
                        uniqueness: { scope: :username }
  
  def self.totalTerms(user) 
    Term.where(user_id: user).count 
  end
  
  def self.totalDefinitions(user)
    Definition.meaning.where(user_id: user).count
  end


end
